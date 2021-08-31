import 'package:flutter/material.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:untitled/screens/new_password.dart';

class EnterCode extends StatefulWidget {
  @override
  _EnterCodeState createState() => _EnterCodeState();
}

class _EnterCodeState extends State<EnterCode> {
  final CustomTimerController _controller = new CustomTimerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);

          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Back",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_outline,
                size: 100,
                color: Colors.blue[700],
              ),
              SizedBox(height: 50),
              Text("Enter Code",
                  style: TextStyle(color: Colors.black, fontSize: 25)),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text("Please enter the code sent to your mobile number",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: "Enter code",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Code expires in :",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    CustomTimer(
                      controller: _controller,
                      from: Duration(seconds: 40),
                      to: Duration(minutes: 0),
                      interval: Duration(seconds: 1),
                      builder: (CustomTimerRemainingTime remaining) {
                        return Text(
                          "${remaining.hours}:${remaining.minutes}:${remaining.seconds}",
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: 45,
                  width: 180,
                  child: TextButton(
                    onPressed: () {
                      _controller.start();
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPassword()),
                      );
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't get the code?",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    " Resend code",
                    style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
