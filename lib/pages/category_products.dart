import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/pages/product_detail.dart';
import 'package:ecommerce_app/services/database.dart';
import 'package:flutter/material.dart';

import '../widgets/support_widget.dart';

class CategoryProduct extends StatefulWidget {
  String category;
  CategoryProduct({required this.category});

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  Stream? CategoryStream;

  getontheload() async {
    CategoryStream = await DatabaseMethods().getPrducts(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allProducts() {
    return StreamBuilder(
        stream: CategoryStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          // SizedBox(height: 1.0),
                          Image.network(
                            ds["Image"],
                            height: 140,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Text(
                            ds["Name"],
                            style: AppWidget.semiboldTextFeildStyle(),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "\$" + ds["Price"],
                                style: TextStyle(
                                    color: Color(0xFFfd6f3e),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetail(detail: ds["Detail"], image: ds["Image"], name: ds["Name"], price: ds["Price"])));
                                },
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFfd6f3e),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: Color(0xfff2f2f2),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [Expanded(child: allProducts())],
        ),
      ),
    );
  }
}
