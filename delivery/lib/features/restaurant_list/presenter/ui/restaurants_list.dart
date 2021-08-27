import 'package:delivery/features/restaurant_detail/restaurat_detail.dart';
import 'package:delivery/features/restaurant_list/domain/entities/restaurant.dart';
import 'package:delivery/features/restaurant_list/presenter/bloc/restaurants_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

enum MenuItem { SAIR, SOBRE }

class RestaurantList extends StatefulWidget {
  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  var _bloc = GetIt.instance<RestaurantsListBloc>();

  @override
  void initState() {
    _bloc.onLoadRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery'),
        actions: <Widget>[
          PopupMenuButton<MenuItem>(
            onSelected: onSelectedItem,
            itemBuilder: (BuildContext context) => <PopupMenuItem<MenuItem>>[
              const PopupMenuItem<MenuItem>(
                value: MenuItem.SAIR,
                child: Text('Sair'),
              ),
              const PopupMenuItem<MenuItem>(
                value: MenuItem.SOBRE,
                child: Text('Sobre'),
              ),
            ],
          )
        ],
      ),
      body: StreamBuilder(
          stream: _bloc.stream,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: _bloc.restaurants.length,
                itemBuilder: (context, position) {
                  Restaurant _restaurant =
                      _bloc.restaurants.elementAt(position);

                  return getCard(_restaurant);
                });
          }),
    );
  }

  Widget getCard(Restaurant restaurant) {
    const titleTextColor = const Color(0xFF090909);
    const descriptionTextColor = const Color(0xFF616161);

    return InkWell(
      onTap: () => _onRestaurantDetail(restaurant),
      child: Card(
        color: Colors.grey[80],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    placeholder: 'assets/placeholder.png',
                    image: restaurant.logo,
                    height: 64,
                    width: 64,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 8.0, left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            restaurant.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: titleTextColor,
                            ),
                          ),
                          Text(
                            restaurant.cousine,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 14,
                                color: descriptionTextColor),
                          ),
                          Text(
                            restaurant.score,
                            style: TextStyle(
                                color: _colorFromHex(restaurant.colorScore)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSelectedItem(MenuItem value) async {
    switch (value) {
      case MenuItem.SAIR:
        {
          // var userDAO = UserDAO();
          // await userDAO.deleteAll();

          SystemNavigator.pop();
          break;
        }
      case MenuItem.SOBRE:
        {
          break;
        }
    }
  }

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  _onRestaurantDetail(Restaurant restaurant) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return RestaurantDetail(
            restaurant: restaurant,
            key: Key('DETAIL-PAGE'),
          );
        },
      ),
    );
  }
}
