import 'dart:async';
import 'package:delivery/modules/restaurants/domain/usecase/get_restaurants_usecase.dart';

class RestaurantsListBloc {
  final GetRestaurantsUseCase usecase;
  RestaurantsListBloc(this.usecase);

  var _controller = StreamController.broadcast();

  Stream get stream => _controller.stream;

  var restaurants = [];

   onLoadRestaurants() async {
    var list = usecase();
    restaurants.add(list);
    _controller.sink.add(true);
  }

  dispose() {
    _controller.close();
  }
}
