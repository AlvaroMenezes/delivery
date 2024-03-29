import 'dart:async';
import 'package:delivery/features/restaurant_list/domain/usecase/get_restaurants_usecase.dart';

class RestaurantsListBloc {
  final GetRestaurantsUseCase usecase;
  RestaurantsListBloc(this.usecase);

  var _controller = StreamController.broadcast();

  Stream get stream => _controller.stream;

  var restaurants = [];

  onLoadRestaurants() async {
    var list = await usecase();
    restaurants.addAll(list);

    _controller.sink.add(true);
  }

  dispose() {
    _controller.close();
  }
}
