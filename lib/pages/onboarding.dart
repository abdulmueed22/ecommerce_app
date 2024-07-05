import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 235, 231),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/headphone.PNG'),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Explore\nThe Best\nProducts',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child:
                      Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
