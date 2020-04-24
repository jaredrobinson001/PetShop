import 'dart:async';
import 'dart:convert';
import 'products_data.dart';
import 'package:http/http.dart' as http;

class ProdProductsRepo implements ProductsRepo {
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";

  @override
  Future<List<Products>> fetchProducts() async {
    http.Response response = await http.get(cryptoUrl);
    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw FetchDataException(
          "An Error Occurred : [Status Code : $statusCode]");
    }
    return responseBody.map((c) => Products.fromMap(c)).toList();
  }

  @override
  Future<List<Products>> fetchPets() {
    // TODO: implement fetchPets
    return null;
  }

  @override
  Future<List<Products>> fetchCategories() {
    // TODO: implement fetchCategories
    return null;
  }

  @override
  Future<List<Products>> fetchServices() {
    // TODO: implement fetchServices
    return null;
  }

  @override
  notifyListeners() {
    // TODO: implement notifyListeners
    return null;
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }
}
