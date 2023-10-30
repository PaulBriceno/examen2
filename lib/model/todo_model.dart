
class TodoModel {
  String? nombre;

  TodoModel({this.nombre});

  TodoModel.fromJson(Map<String, dynamic> json) {
    nombre = json["nombre"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["nombre"] = nombre;
    return _data;
  }
}