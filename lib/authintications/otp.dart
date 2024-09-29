import 'package:chat_box_2024/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  String varifiacation_id;
  Otp({super.key, required this.varifiacation_id});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                Text(
                  "please varify your number",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 98, 4, 240)),
                ),
              ],
            ),
            TextField(
              controller: otp,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "enter OTP"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black)),
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                            verificationId: widget.varifiacation_id,
                            smsCode: otp.text.toString());
                    FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatPage()));
                    });
                  } catch (ex) {}
                },
                child: Text("varify",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 98, 4, 240))))
          ],
        ),
      ),
    );
  }
}
