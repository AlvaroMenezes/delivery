import 'dart:convert';

import 'package:delivery/base/data_source.dart';
import 'package:delivery/features/restaurant_list/data/datasource/exceptions/get_restaurants_datasource_exception.dart';
import 'package:delivery/features/restaurant_list/data/datasource/get_restaurants_data_source.dart';
import 'package:delivery/features/restaurant_list/data/model/restaurant_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientAdapterMock extends Mock implements HttpClientAdapter {}

class RequestOptionsFake extends Fake implements RequestOptions {}

void main() {
  Dio dio;
  late HttpClientAdapter adapterMock;
  var response;
  late DataSource dataSource;

  setUpAll(() {
    registerFallbackValue(RequestOptionsFake());
    dio = Dio();
    adapterMock = HttpClientAdapterMock();
    dio.httpClientAdapter = adapterMock;
    dataSource = GetRestaurantsDataSource(dio);

    response = {
      'data': [
        {
          'name': 'A',
          'logo': 'B',
          'score': 'C',
          'colorScore': 'D',
          'delivery': 'E',
          'cousine': 'F',
          'photoPlate': 'G',
          'plateName': 'H',
          'description': 'I',
          'price': 'J'
        }
      ]
    };
  });

  test('Response status shoud be 200', () async {
    when(() => adapterMock.fetch(any(), any(), any())).thenAnswer(
        (_) async => ResponseBody.fromString(json.encode(response), 200));

    var list = await dataSource((json) => RestaurantModel.fromJson(json))!;
    expect(list[0].name, 'A');
  });

  test('status code 500 should throws BadRequestException', () async {
    when(() => adapterMock.fetch(any(), any(), any())).thenAnswer(
        (_) async => ResponseBody.fromString(json.encode(response), 500));
    try {
      await dataSource((json) => RestaurantModel.fromJson(json))!;
    } catch (_) {
      expect(_, isA<GetRestaurantsDataSourceException>());
    }
  });
}
