import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:online_store/provider/product_provider.dart';
import 'package:online_store/screens/searchpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Online Store',
                style: TextStyle(color: Colors.black),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Consumer(
            builder: (context, ref, child) {
              final productData = ref.watch(productProvider);
              return Container(
                padding: EdgeInsets.all(14),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey)),
                      child: TextField(
                        onTap: () {
                          Get.to(SearchPage());
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Search items'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: GridView.builder(
                      itemCount: productData.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 12,
                          mainAxisExtent: 280,
                          mainAxisSpacing: 12,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(153, 240, 240, 240)),
                          child: Column(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                  height: 150,
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('\$' + productData.products[index].price,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightGreen))
                              ],
                            ),
                          ]),
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
