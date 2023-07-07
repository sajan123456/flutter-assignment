import 'package:online_store/models/products.dart';

import '../services/api_services.dart';

class ProductState {
  final String apiPath;
  final bool isLoad;
  final String errMessage;
  final List<Products> products;
  // final List<SearchData> searchData;

  ProductState(
      {required this.apiPath,
      required this.isLoad,
      required this.errMessage,
      // required this.searchData,
      required this.products});

  ProductState.initState()
      : apiPath = Api.baseApi,
        products = [],
        errMessage = '',
        // searchData = [],
        isLoad = false;

  ProductState copyWith(
      {bool? isLoad,
      String? apiPath,
      String? errMessage,
      // List<SearchData>? searchData,
      List<Products>? products}) {
    return ProductState(
        apiPath: apiPath ?? this.apiPath,
        isLoad: isLoad ?? this.isLoad,
        errMessage: errMessage ?? this.errMessage,
        // searchData: searchData ?? this.searchData,
        products: products ?? this.products);
  }
}
