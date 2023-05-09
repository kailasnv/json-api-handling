// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:fakeapi/modals/modal.dart';
import 'package:http/http.dart' as http;

class Repositary {
  static Future<List<ProductModal>> getProducts() async {
    try {
      // fetching api
      const String URL = "https://fakestoreapi.com/products";
      final uri = Uri.parse(URL);
      final response = await http.get(uri);
      print("STATUS CODE : ${response.statusCode}");
      //
      // an initial empty list
      List<ProductModal> productsList = [];

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        for (var eachData in jsonData) {
          final _modal = ProductModal.fromJson(eachData);
          // adding to list
          productsList.add(_modal);
        }
        return productsList;
      } else {
        print("<< No Connection >>");
        throw Exception();
      }

      //
    } catch (e) {
      print("Network Error  : $e");
      // PopUps().showErrorMessage(context, e.toString()); // this shows  a snackbar
      throw Exception();
    }
  }
}
