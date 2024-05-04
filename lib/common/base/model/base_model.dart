abstract class BaseModel<T> {
  T baseFromJson(Map<String, dynamic> json);
  Map<String, dynamic> baseToJson();
}
