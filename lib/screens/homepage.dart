import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_store/provider/product_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Consumer(
        builder: (context, ref, child) {
          final productData = ref.watch(productProvider);
          return ListView.builder(
            itemCount: productData.products.length,
            itemBuilder: (context, index) {
              return Container(
                child: Text(productData.products[index].title),
              );
            },
          );
        },
      )),
    );
  }
}
