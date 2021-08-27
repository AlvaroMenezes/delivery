import 'package:delivery/base/base_model.dart';
import 'package:delivery/features/restaurant_list/domain/entities/restaurant.dart';

class RestaurantModel extends Restaurant implements BaseModel {
  RestaurantModel(name, logo, score, colorScore, delivery, cousine, photoPlate,
      plateName, description, price)
      : super(name, logo, score, colorScore, delivery, cousine, photoPlate,
            plateName, description, price);

  factory RestaurantModel.fromJson(Map json) {
    RestaurantModel model = RestaurantModel(
        json['name'] ?? '',
        json['logo'] ?? '',
        json['score'] ?? '',
        json['colorScore'] ?? '',
        json['delivery'] ?? '',
        json['cousine'] ?? '',
        json['photoPlate'] ?? '',
        json['plateName'] ?? '',
        json['description'] ?? '',
        json['price'] ?? '');

    return model;
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();

    map['name'] = name;
    map['logo'] = logo;
    map['score'] = score;
    map['colorScore'] = colorScore;
    map['delivery'] = delivery;
    map['cousine'] = cousine;
    map['photoPlate'] = photoPlate;
    map['plateName'] = plateName;
    map['description'] = description;
    map['price'] = price;

    return map;
  }
}
