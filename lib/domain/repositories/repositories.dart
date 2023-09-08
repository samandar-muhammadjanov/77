// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/domain/models/categories_model.dart';
import 'package:hakaton_uic/domain/models/product_detail_model.dart';
import 'package:hakaton_uic/domain/models/products_model.dart';
import 'package:hakaton_uic/domain/models/user_model.dart';
import 'package:hakaton_uic/domain/models/user_products_model.dart';
import 'package:hakaton_uic/domain/urls.dart';
import 'package:hakaton_uic/precentation/auth_pages/success_page.dart';
import 'package:hakaton_uic/precentation/pages/home_page.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  bool isLogined = false;
  Future<List<Products>> getProducts(PARAMETERS) async {
    final response =
        await http.get(Uri.parse(BASE_URL + PRODUCTS + PARAMETERS));

    if (response.statusCode == 200) {
      List<Products> products =
          productsFromJson(utf8.decode(response.bodyBytes));
      return products;
    } else {
      return throw Exception(response.statusCode);
    }
  }

  Future<void> registration(String fullName, String projectName, int categoryId,
      String phoneNumber, String address, BuildContext context) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(BASE_URL + REGISTRATION));
    request.body = json.encode({
      "full_name": fullName,
      "project_name": projectName,
      "category": categoryId,
      "phone_number": "998$phoneNumber",
      "address": address
    });
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 201) {
      Navigator.pushNamed(context, SuccessPage.routeName);
    } else {
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          backgroundColor: Colors.red,
          content: Text(
            utf8.decode(response.bodyBytes),
            style: TextStyle(color: kWhite),
          ),
          actions: [
            IconButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).removeCurrentMaterialBanner(),
              icon: Icon(
                Icons.close,
                color: kWhite,
              ),
            ),
          ],
        ),
      );
      Future.delayed(
        const Duration(seconds: 2),
        () => ScaffoldMessenger.of(context).removeCurrentMaterialBanner(),
      );
    }
  }

  Future<List<Categories>> getCategories() async {
    var response = await http.get(Uri.parse(BASE_URL + CATEGORIES));

    if (response.statusCode == 200) {
      List<Categories> categories =
          categoriesFromJson(utf8.decode(response.bodyBytes));
      return categories;
    } else {
      return throw Exception("Something went wrong: ${response.statusCode}");
    }
  }

  Future<void> login(
      String phoneNumber, String password, BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BASE_URL + LOGIN),
        body: {"phone_number": phoneNumber, "password": password});
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      isLogined = true;
      await preferences.setString("accessToken", body["access_token"]);
      await preferences.setString("refreshToken", body["refresh_token"]);
      await preferences.setBool("isLogined", isLogined);
      context.read<AuthBloc>().add(AuthinticatedEvent(isLogined));
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.routeName, (route) => false);
    } else {
      return;
    }
  }

  Future<UserData> getUserData(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var accessToken = preferences.getString("accessToken");
    var headers = {'Authorization': 'Bearer $accessToken'};
    final response = await http.get(Uri.parse(BASE_URL + ME), headers: headers);

    if (response.statusCode == 200) {
      UserData userData = userDataFromJson(utf8.decode(response.bodyBytes));
      return userData;
    } else if (response.statusCode == 401) {
      refreshToken();
      return getUserData(context);
    } else {
      return throw Exception(response.statusCode);
    }
  }

  Future<List<MyProducts>> getUserProducts(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var accessToken = preferences.getString("accessToken");

    var headers = {'Authorization': 'Bearer $accessToken'};
    var response =
        await http.get(Uri.parse(BASE_URL + USER_PRODUCTS), headers: headers);

    if (response.statusCode == 200) {
      List<MyProducts> userProducts =
          myProductsFromJson(utf8.decode(response.bodyBytes));
      return userProducts;
    } else if (response.statusCode == 401) {
      refreshToken();
      return getUserProducts(context);
    } else {
      return throw Exception(response.body);
    }
  }

  Future<ProductDetail> getProductDetail(
      String SLUG, BuildContext context) async {
    var response = await http.get(
      Uri.parse(BASE_URL + PRODUCT_DETAIL + SLUG),
    );

    if (response.statusCode == 200) {
      ProductDetail productDetail =
          productDetailFromJson(utf8.decode(response.bodyBytes));

      return productDetail;
    } else {
      return throw Exception(response.statusCode);
    }
  }

  Future<void> refreshToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final refreshToken = preferences.getString("refreshToken");
    final response = await http.post(Uri.parse(BASE_URL + REFRESH_TOKEN),
        body: {"refresh_token": refreshToken});
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      await preferences.setString("accessToken", body["access_token"]);
    } else {
      return;
    }
  }
}
