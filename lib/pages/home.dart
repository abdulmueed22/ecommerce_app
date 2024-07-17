import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/pages/category_products.dart';
import 'package:ecommerce_app/pages/product_detail.dart';
import 'package:ecommerce_app/services/database.dart';
import 'package:ecommerce_app/services/shared_pref.dart';
import 'package:ecommerce_app/widgets/support_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool search = false;
  List categories = [
    "images/headphone_icon.png",
    "images/laptop.png",
    "images/watch.png",
    "images/TV.png"
  ];

  List Categoryname = ["Headphone", "Laptop", "Watch", "TV"];

  var queryResultSet = [];
  var tempSearchStore = [];
  TextEditingController searchController= new TextEditingController();

  initiateSearch(value) async {
    if (value.length == 0 || value.isEmpty) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }
    setState(() {
      search = true;
    });

    var CapatilizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);
    if (queryResultSet.isEmpty && value.length == 1) {
      DatabaseMethods().search(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.docs.length; ++i) {
          queryResultSet.add(docs.docs[i].data());
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['UpdatedName'].startsWith(CapatilizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  String? name, image;

  getthesharedpref() async {
    name = await SharedPreferenceHelper().getUserName();
    image = await SharedPreferenceHelper().getUserImage();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: name == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey, " + name!,
                              style: AppWidget.boldTextFeildStyle(),
                            ),
                            Text('Good Morning',
                                style: AppWidget.lightTextFeildStyle()),
                          ],
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              image!,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          initiateSearch(value.toUpperCase());
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Products',
                            hintStyle: AppWidget.lightTextFeildStyle(),
                            prefixIcon: search
                                ? GestureDetector(
                                onTap: (){
                                  search = false;
                                  tempSearchStore=[];
                                  queryResultSet = [];
                                  searchController.text = "";
                                  setState(() {

                                  });
                                },
                                child: Icon(Icons.close))
                                : Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  )),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    search
                        ? ListView(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            primary: false,
                            shrinkWrap: true,
                            children: tempSearchStore.map((element) {
                              return buildResultCard(element);
                            }).toList(),
                          )
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Categories',
                                        style:
                                            AppWidget.semiboldTextFeildStyle()),
                                    Text(
                                      'see all',
                                      style: TextStyle(
                                          color: Color(0xFFfd6f3e),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: 130,
                                      padding: EdgeInsets.all(20),
                                      margin: EdgeInsets.only(right: 20),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFD6F3E),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        'All',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  Expanded(
                                    child: Container(
                                      height: 130,
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: categories.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return CategoryTile(
                                                image: categories[index],
                                                name: Categoryname[index]);
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('All Products',
                                      style:
                                          AppWidget.semiboldTextFeildStyle()),
                                  Text(
                                    'see all',
                                    style: TextStyle(
                                        color: Color(0xFFfd6f3e),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                height: 230,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 20.0),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'images/headphone2.png',
                                            height: 140,
                                            width: 140,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            "Headphone",
                                            style:
                                                AppWidget.boldTextFeildStyle(),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$100',
                                                style: TextStyle(
                                                    color: Color(0xFFfd6f3e),
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 80,
                                              ),
                                              Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFfd6f3e),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7)),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 20.0),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'images/watch2.png',
                                            height: 140,
                                            width: 140,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            "Apple Watch",
                                            style:
                                                AppWidget.boldTextFeildStyle(),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$300',
                                                style: TextStyle(
                                                    color: Color(0xFFfd6f3e),
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 80,
                                              ),
                                              Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFfd6f3e),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7)),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'images/laptop2.png',
                                            height: 140,
                                            width: 140,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            "Laptop",
                                            style:
                                                AppWidget.boldTextFeildStyle(),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$1000',
                                                style: TextStyle(
                                                    color: Color(0xFFfd6f3e),
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 80,
                                              ),
                                              Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFfd6f3e),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7)),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildResultCard(data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                    detail: data["Detail"],
                    image: data["Image"],
                    name: data["Name"],
                    price: data["Price"])));
      },
      child: Container(
        padding: EdgeInsets.only(left: 20.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: 100,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                data["Image"],
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              data["Name"],
              style: AppWidget.semiboldTextFeildStyle(),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  String image, name;
  CategoryTile({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryProduct(category: name)));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
