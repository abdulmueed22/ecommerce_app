import 'package:flutter/material.dart';

import '../widgets/support_widget.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffef5f1),
      body: Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.arrow_back_ios_new_outlined)),
              ),
              Center(
                  child: Image.asset(
                'images/headphone2.png',
                height: 350,
              ))
            ]),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Headphone',
                          style: AppWidget.boldTextFeildStyle(),
                        ),
                        Text(
                          '\$300',
                          style: TextStyle(
                              color: Color(0xFFfd6f3e),
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Details',
                      style: AppWidget.semiboldTextFeildStyle(),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                        "The product is very good. It has 1 year warranty. These headphones are too good like you can also listen a person who is speaking slowly. But be aware of mueed because he speaks very loudly"),
                    SizedBox(height: 90.0),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                        color: Color(0xfffd6f3e), borderRadius: BorderRadius.circular(10)
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: Text("Buy Now", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)),

                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
