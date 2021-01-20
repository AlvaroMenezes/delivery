import 'package:delivery/base/base_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

abstract class DataSource {
  Future<BaseModel> call<T>(
      {Map<String, String> param, @required FromJson<T> fromJson});
}
