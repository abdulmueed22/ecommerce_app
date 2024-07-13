import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import '../widgets/support_widget.dart';
import 'package:ecommerce_app/services/constraint.dart';

class ProductDetail extends StatefulWidget {
  final String image, name, detail, price;

  ProductDetail(
      {required this.detail,
        required this.image,
        required this.name,
        required this.price});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Map<String, dynamic>? paymentIntent;

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
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.arrow_back_ios_new_outlined)),
              ),
              Center(
                  child: Image.network(
                    widget.image,
                    height: 350,
                  )),
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
                          widget.name,
                          style: AppWidget.boldTextFeildStyle(),
                        ),
                        Text(
                          '\$' + widget.price,
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
                      "Details",
                      style: AppWidget.semiboldTextFeildStyle(),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(widget.detail),
                    SizedBox(height: 90.0),
                    GestureDetector(
                      onTap: () {
                        makePayment(widget.price);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        decoration: BoxDecoration(
                            color: Color(0xfffd6f3e),
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
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

  Future<void> makePayment(String amount) async {
    try {
      var paymentIntent = await createPaymentIntent(amount, 'USD');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent?['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'Adan',
        ),
      );
      displayPaymentSheet();
    } catch (e, s) {
      print('exception: $e $s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      Text("Payment Successful")
                    ],
                  )
                ],
              ),
            ));
        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('Error is :---? $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is :---> $e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text("Cancelled"),
          ));
    } catch (e) {
      print('$e');
    }
  }

  Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretkey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to create payment intent: ${response.body}');
        return null;
      }
    } catch (err) {
      print('Error charging user: ${err.toString()}');
      return null;
    }
  }

  String calculateAmount(String amount) {
    final calculateAmount = (int.parse(amount) * 100);
    return calculateAmount.toString();
  }
}


// import 'dart:convert';
//
// import 'package:ecommerce_app/services/constraint.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
//
// import '../widgets/support_widget.dart';
//
// class ProductDetail extends StatefulWidget {
//   final String image, name, detail, price;
//
//   ProductDetail(
//       {required this.detail,
//       required this.image,
//       required this.name,
//       required this.price});
//
//   @override
//   _ProductDetailState createState() => _ProductDetailState();
// }
//
// class _ProductDetailState extends State<ProductDetail> {
//   Map<String, dynamic>? paymentIntent;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xfffef5f1),
//       body: Container(
//         padding: EdgeInsets.only(top: 60),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                     margin: EdgeInsets.only(left: 15),
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(30)),
//                     child: Icon(Icons.arrow_back_ios_new_outlined)),
//               ),
//               Center(
//                   child: Image.network(
//                 widget.image,
//                 height: 350,
//               )),
//             ]),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.only(left: 20, top: 20, right: 20),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20))),
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           widget.name,
//                           style: AppWidget.boldTextFeildStyle(),
//                         ),
//                         Text(
//                           '\$' + widget.price,
//                           style: TextStyle(
//                               color: Color(0xFFfd6f3e),
//                               fontSize: 23.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Text(
//                       "Details",
//                       style: AppWidget.semiboldTextFeildStyle(),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Text(widget.detail),
//                     SizedBox(height: 90.0),
//                     GestureDetector(
//                       onTap: (){
//                         makePayment(widget.price);
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(vertical: 7),
//                         decoration: BoxDecoration(
//                             color: Color(0xfffd6f3e),
//                             borderRadius: BorderRadius.circular(10)),
//                         width: MediaQuery.of(context).size.width,
//                         child: Center(
//                             child: Text(
//                           "Buy Now",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         )),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> makePayment(String amount) async {
//     try {
//       var paymentIntent = await createPaymentIntent(amount, 'USD');
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent?['client_secret'],
//           style: ThemeMode.dark,
//           merchantDisplayName: 'Adan',
//         ),
//       );
//       displayPaymentSheet();
//     } catch (e, s) {
//       print('exception: $e $s');
//     }
//   }
//
//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet().then((value) async {
//         showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//                   content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.check_circle,
//                             color: Colors.green,
//                           ),
//                           Text("Payment Successfull")
//                         ],
//                       )
//                     ],
//                   ),
//                 ));
//         paymentIntent = null;
//       }).onError((error, stackTrace) {
//         print('Error is :---? $error $stackTrace');
//       });
//     } on StripeException catch (e) {
//       print('Error is :---> $e');
//       showDialog(
//           context: context,
//           builder: (_) => AlertDialog(
//                 content: Text("Cancelled"),
//               ));
//     } catch (e) {
//       print('$e');
//     }
//   }
//
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };
//
//       var response = await http.post(
//           Uri.parse('https://api.stripe.com/v1/payment_intents'),
//           headers: {'Authorization': 'Beared $secretkey', 'Content-Type': 'application/x-www-form-urlencoded', },
//       body: body,
//       );
//       return jsonDecode(response.body);
//     } catch (err) {
//       print('err charging user: ${err.toString()}');
//     }
//   }
//
//   calculateAmount(String amount) {
//     final calculateAmount = (int.parse(amount) * 100);
//     return calculateAmount.toString();
//   }
// }
//
// This is the flutter code of page to buy a product using stripe in an ecommerce app. The code has no error but is not opening the dialog box for stripe payment can please check what i have missed and make it able to work