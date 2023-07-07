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
      child: Scaffold(body: Consumer(
        builder: (context, ref, child) {
          final productData = ref.watch(productProvider);
          return Container(
            child: Column(
              children: [
                Text(
                  'Welcome to Online Store',
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                  color: Color.fromARGB(255, 173, 173, 173),
                  child: TextField(
                    onTap: () {
                      Get.to(SearchPage());
                    },
                    decoration: InputDecoration(hintText: 'Search items'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: GridView.builder(
                  itemCount: productData.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 8,
                      mainAxisExtent: 300,
                      mainAxisSpacing: 8,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white60),
                      child: Column(children: [
                        Image(
                            height: 150,
                            image: NetworkImage(
                                productData.products[index].image)),
                        Text(productData.products[index].title),
                        Text(
                          productData.products[index].price,
                        )
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
