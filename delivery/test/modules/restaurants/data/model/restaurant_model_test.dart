import 'package:delivery/modules/restaurants/data/model/exception/restaurant_model_exception.dart';
import 'package:delivery/modules/restaurants/data/model/restaurant_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var response;
  var map;
  RestaurantModel restaurantModel;

  setUp(() async {
    response = {
      "name": "A",
      "logo": "B",
      "score": "C",
      "colorScore": "D",
      "delivery": "E",
      "cousine": "F",
      "photoPlate": "G",
      "plateName": "H",
      "description": "I",
      "price": "J",
    };
  });

  group('RestaurantModel Json Parser', () {
    test('parse should fail and throw RestaurantModelParseException ', () {
      expect(() => RestaurantModel.fromJson(null),
          throwsA(isA<RestaurantModelParseException>()));
    });

    test('[ RestaurantModel ] should be parsed', () {
      restaurantModel = RestaurantModel.fromJson(response);
      expect(restaurantModel, isA<RestaurantModel>());
    });

    test('name should be [A] ', () {
      expect(restaurantModel.name, 'A');
    });

    test('logo should be [B] ', () {
      expect(restaurantModel.logo, 'B');
    });

    test('score should be [C] ', () {
      expect(restaurantModel.score, 'C');
    });

    test('colorScore should be [D] ', () {
      expect(restaurantModel.colorScore, 'D');
    });

    test('delivery should be [E] ', () {
      expect(restaurantModel.delivery, 'E');
    });
    test('cousine should be [F] ', () {
      expect(restaurantModel.cousine, 'F');
    });
    test('photoPlate should be [G] ', () {
      expect(restaurantModel.photoPlate, 'G');
    });
    test('plateName should be [H] ', () {
      expect(restaurantModel.plateName, 'H');
    });
    test('description should be [I] ', () {
      expect(restaurantModel.description, 'I');
    });

    test('price should be [J] ', () {
      expect(restaurantModel.price, 'J');
    });
  });

  group('RestaurantModel to map test', () {
    test('should parse to map', () {
      restaurantModel = RestaurantModel.fromJson(response);

      map = restaurantModel.toMap();
      expect(map, isA<Map>());
    });

    test('name should be [A] ', () {
      expect(map['name'], 'A');
    });

    test('logo should be [B] ', () {
      expect(map['logo'], 'B');
    });

    test('score should be [C] ', () {
      expect(map['score'], 'C');
    });

    test('colorScore should be [D] ', () {
      expect(map['colorScore'], 'D');
    });

    test('delivery should be [E] ', () {
      expect(map['delivery'], 'E');
    });
    test('cousine should be [F] ', () {
      expect(map['cousine'], 'F');
    });
    test('photoPlate should be [G] ', () {
      expect(map['photoPlate'], 'G');
    });
    test('plateName should be [H] ', () {
      expect(map['plateName'], 'H');
    });
    test('description should be [I] ', () {
      expect(map['description'], 'I');
    });

    test('price should be [J] ', () {
      expect(map['price'], 'J');
    });
  });
}
