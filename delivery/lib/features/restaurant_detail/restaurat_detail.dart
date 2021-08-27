import 'package:delivery/features/restaurant_list/domain/entities/restaurant.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RestaurantDetail extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantDetail({required Key key, required this.restaurant})
      : super(key: key);

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  @override
  Widget build(BuildContext context) {
    const titleTextColor = const Color(0xFF090909);
    const descriptionTextColor = const Color(0xFF616161);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Delivey'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Text(
                widget.restaurant.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: titleTextColor,
                ),
              ),
              Text(
                widget.restaurant.cousine,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: descriptionTextColor),
              ),
              FadeInImage.assetNetwork(
                placeholder: 'assets/loader.gif',
                image: widget.restaurant.photoPlate,
                height: 256,
              ),
              Text(
                widget.restaurant.plateName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: titleTextColor,
                ),
              ),
              SizedBox(height: 16),
              Text(widget.restaurant.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: descriptionTextColor)),
              SizedBox(height: 8),
              Text('Entrega: ${widget.restaurant.delivery}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: descriptionTextColor)),
              Text(widget.restaurant.price,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }
}
