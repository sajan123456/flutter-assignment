import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_state.dart';
import '../services/api_services.dart';

final productProvider = StateNotifierProvider<ProductProvider, ProductState>(
    (ref) => ProductProvider(ProductState.initState()));

class ProductProvider extends StateNotifier<ProductState> {
  ProductProvider(super.state) {
    getData();
  }
  Future<void> getData() async {
    try {
      state = state.copyWith(isLoad: true);
      final response = await ApiService.getProducts();
      state = state
          .copyWith(isLoad: false, products: [...state.products, ...response]);
    } catch (err) {
      print(err);
    }
  }
}
