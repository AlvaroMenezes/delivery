import 'dart:convert';

import 'package:delivery/base/Endpoint.dart';
import 'package:delivery/base/data_source.dart';
import 'package:delivery/modules/restaurants/data/datasource/exceptions/get_restaurants_datasource_exception.dart';
import 'package:delivery/modules/restaurants/data/model/restaurant_model.dart';
import 'package:dio/dio.dart';

class GetRestaurantsDataSource implements DataSource {
  final String _webService = "5ea863122d00003b4a3a3f73";
  final Dio _dio;
  GetRestaurantsDataSource(this._dio);

  @override
  Future call(FromJson fromJson) async {
    String url = '${EndPoint.URL}$_webService';

    try {
      var response = await _dio.get(url);
      print(response);

      var _json = json.decode(response.data);

      var list = List<RestaurantModel>.from(
          (_json as List).map((i) => fromJson(i)).toList());

      return list;
    } on DioError catch (e) {
      throw GetRestaurantsDataSourceException(
          '${e.response.statusCode}', e.response.data.toString());
    }
  }
}
