import 'package:delivery/base/base_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef FromJson =  Function(Map<String, dynamic> json);

abstract class DataSource {
  Future call(FromJson fromJson);
}
