import 'package:ecommerce_app/pages/bottomnav.dart';
import 'package:ecommerce_app/pages/login.dart';
import 'package:ecommerce_app/services/database.dart';
import 'package:ecommerce_app/services/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../widgets/support_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? name, email, password;
  TextEditingController nameController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registraition() async {
    if (password != null && name != null && email != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0),
            )));
        String Id = randomAlphaNumeric(10);
        
        await SharedPreferenceHelper().saveUserEmail(mailController.text);
        await SharedPreferenceHelper().saveUserName(nameController.text);
        await SharedPreferenceHelper().saveUserId(Id);
        await SharedPreferenceHelper().saveUserImage("https://cdn.vectorstock.com/i/1000x1000/75/30/smiling-avatar-boy-graphic-vector-9437530.webp");

        Map<String, dynamic> userInfoMap = {
          "Name": nameController.text,
          "Email": mailController.text,
          "Id": Id,
          "Image":
              "https://cdn.vectorstock.com/i/1000x1000/75/30/smiling-avatar-boy-graphic-vector-9437530.webp"
        };

        await DatabaseMethods().addUserDetails(userInfoMap, Id);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 20.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Account Already Exists",
                style: TextStyle(fontSize: 20.0),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/login.png',
                ),
                Center(
                    child: Text(
                  'Sign Up',
                  style: AppWidget.semiboldTextFeildStyle(),
                )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please enter the details below to\n                     continue.',
                  style: AppWidget.lightTextFeildStyle(),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Name',
                  style: AppWidget.semiboldTextFeildStyle(),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      color: Color(0xfff4f5f9),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Name';
                      } else {
                        return null;
                      }
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Name"),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Email',
                  style: AppWidget.semiboldTextFeildStyle(),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      color: Color(0xfff4f5f9),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Email';
                      } else {
                        return null;
                      }
                    },
                    controller: mailController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Email"),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Password',
                  style: AppWidget.semiboldTextFeildStyle(),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      color: Color(0xfff4f5f9),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Password';
                      } else {
                        return null;
                      }
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Password"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        name = nameController.text;
                        email = mailController.text;
                        password = passwordController.text;
                      });
                    }
                    registraition();
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: Color(0xFF1976D2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text('SIGN UP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: AppWidget.lightTextFeildStyle(),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w500),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
