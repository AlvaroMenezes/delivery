import 'dart:convert';

import 'package:delivery/base/Endpoint.dart';
import 'package:delivery/base/data_source.dart';
import 'package:delivery/modules/restaurants/data/datasource/exceptions/get_restaurants_datasource_exception.dart';
import 'package:delivery/modules/restaurants/data/model/restaurant_model.dart';
import 'package:dio/dio.dart';

class GetRestaurantsDataSource implements DataSource {
  final String _webService = "7898494f-5a2e-454d-94f1-aaa0f70020ca";
  final Dio _dio;
  GetRestaurantsDataSource(this._dio);

  @override
  Future call(FromJson fromJson) async {
    String url = '${EndPoint.URL}$_webService';

    try {
      var response = await _dio.get(url);

      var _json = json.decode(json.encode(response.data));

      var list = List<RestaurantModel>.from(
          (_json['data'] as List).map((i) => fromJson(i)).toList());

      return list;
    } on DioError catch (e) {
      print(e.message);
      throw GetRestaurantsDataSourceException(' ', e.message);
    }
  }
}
