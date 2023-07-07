import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:online_store/screens/details_page.dart';

import '../models/products.dart';
import '../utils/constants.dart';

class SearchPage extends StatefulWidget {
  // const SearchPage({super.key});
  final List<Products> products;
  SearchPage({required this.products});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Products> displayList = [];
  int productIndex = 0;

  void updateList(String value) {
    print('updatelist');
    setState(() {
      widget.products.forEach((element) {
        if (element.title.toLowerCase().contains(value)) {
          displayList.clear();

          if (!displayList.contains(element)) {
            productIndex = element.id;
            displayList.add(element);
          } else {
            print('no date');
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Search Items',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 45,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(255, 230, 230, 230)
                  // border: Border.all(color: Colors.grey)
                  ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Search here'),
                onChanged: (value) {
                  updateList(value);
                },
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(DetailsPage(
                        productDetails: widget.products[productIndex]));
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
                            image: NetworkImage(displayList[index].image)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(displayList[index].title,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: kGreyColor,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('\$' + displayList[index].price,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ]),
                  ),
                );
                // child: Text('data'),
              },
            ))
          ]),
        ),
      ),
    );
  }
}
