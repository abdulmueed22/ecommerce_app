import 'package:ecommerce_app/pages/login.dart';
import 'package:flutter/material.dart';

import '../widgets/support_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/boy.jpg',),
              Center(child: Text('Sign Up', style: AppWidget.semiboldTextFeildStyle(),)),
              SizedBox(height: 20,),
              Text('Please enter the details below to\n                     continue.', style: AppWidget.lightTextFeildStyle(),),
              SizedBox(height: 40,),
              Text('Name', style: AppWidget.semiboldTextFeildStyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                    color: Color(0xfff4f5f9),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Name"
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Email', style: AppWidget.semiboldTextFeildStyle(),),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                    color: Color(0xfff4f5f9),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Email"
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Password', style: AppWidget.semiboldTextFeildStyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                    color: Color(0xfff4f5f9),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Password"
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Colors.green, borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('SIGN UP', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold))),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ', style: AppWidget.lightTextFeildStyle(),),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                      },
                      child:
                  Text('Sign In', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
