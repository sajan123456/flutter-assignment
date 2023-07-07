import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:online_store/provider/product_provider.dart';
import 'package:online_store/screens/details_page.dart';
import 'package:online_store/screens/searchpage.dart';
import 'package:online_store/utils/constants.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.more_vert_outlined,
            ),
            title: Center(
              child: Text(
                'Online Store',
              ),
            ),
            actions: [
              Icon(
                Icons.favorite_border,
              ),
              SizedBox(
                width: 20,
              )
            ],
            elevation: 0,
            backgroundColor: kPrimaryColor,
          ),
          body: Consumer(
            builder: (context, ref, child) {
              final productData = ref.watch(productProvider);
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Find your goods here',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: kGreyColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(SearchPage(
                          products: productData.products,
                        ));
                      },
                      child: Container(
                          height: 45,
                          width: double.infinity,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color.fromARGB(255, 230, 230, 230)
                              // border: Border.all(color: Colors.grey)
                              ),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Search items',
                                style: TextStyle(color: kGreyColor),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: GridView.builder(
                      itemCount: productData.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 12,
                          mainAxisExtent: 230,
                          mainAxisSpacing: 12,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(DetailsPage(
                                productDetails: productData.products[index]));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kCardBgColor),
                            child: Column(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image(
                                    height: 120,
                                    image: NetworkImage(
                                        productData.products[index].image)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productData.products[index].title,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: kGreyColor,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('\$' + productData.products[index].price,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ]),
                          ),
                        );
                      },
                    )),
                  ],
                ),
              );
            },
          )),
    );
  }
}
