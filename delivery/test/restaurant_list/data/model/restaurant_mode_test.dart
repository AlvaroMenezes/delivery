import 'package:delivery/features/restaurant_list/data/model/restaurant_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  var response;

  RestaurantModel? restaurantModel;

  setUpAll(() {
    response = {
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
    };

    restaurantModel = RestaurantModel.fromJson(response);
  });

  group('Restaurant json parse', () {
    test('RestaurantModel should be instance of RestaurantModel', () {
      expect(restaurantModel, isA<RestaurantModel>());
    });

    test('name should be A', () {
      expect(restaurantModel!.name, 'A');
    });

    test('logo should be B', () {
      expect(restaurantModel!.logo, 'B');
    });

    test('score should be C', () {
      expect(restaurantModel!.score, 'C');
    });

    test('colorScore should be D', () {
      expect(restaurantModel!.colorScore, 'D');
    });

    test('delivery should be E', () {
      expect(restaurantModel!.delivery, "E");
    });

    test('cousine should be F', () {
      expect(restaurantModel!.cousine, 'F');
    });

    test('photoPlate should be G', () {
      expect(restaurantModel!.photoPlate, 'G');
    });

    test('plateName should be H', () {
      expect(restaurantModel!.plateName, "H");
    });

    test('description should be I', () {
      expect(restaurantModel!.description, "I");
    });

    test('price streetName should be J', () {
      expect(restaurantModel!.price, "J");
    });
  });
}
