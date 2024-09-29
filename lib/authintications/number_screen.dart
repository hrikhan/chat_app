import 'package:chat_box_2024/authintications/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  TextEditingController phonenumber = TextEditingController();
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
                  "welcome to chatbox",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 98, 4, 240)),
                ),
              ],
            ),
            TextField(
              controller: phonenumber,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "enter the number"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black)),
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException ex) {},
                      codeSent: (String veification_id, int? resend) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Otp(varifiacation_id: veification_id,)));
                      },
                      codeAutoRetrievalTimeout: (String verifcation_id) {},
                      phoneNumber: phonenumber.text.toString());
                },
                child: Text("Sign in",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 98, 4, 240))))
          ],
        ),
      ),
    );
  }
}
