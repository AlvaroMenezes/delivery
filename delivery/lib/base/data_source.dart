typedef FromJson = Function(Map<String, dynamic> json);

abstract class DataSource {
  call(FromJson? fromJson);
}
