import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:online_store/models/products.dart';
import 'package:online_store/utils/constants.dart';

class DetailsPage extends StatelessWidget {
  // const DetailsPage({super.key});
  final Products productDetails;
  DetailsPage({required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // title: Center(child: Text('Online Store')),
          backgroundColor: kPrimaryColor,
          elevation: 0,
          leading: Icon(CupertinoIcons.back),
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: ListView(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Image(
                          height: 300,
                          image: NetworkImage(productDetails.image))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    productDetails.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\$' + productDetails.price,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: kPrimaryColor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(productDetails.description),
                ],
              )),
        ),
      ),
    );
  }
}
