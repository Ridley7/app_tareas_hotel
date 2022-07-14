class Empleado{
  String nombre;
  int id;

  Empleado({required this.nombre, required this.id});

  factory Empleado.fromJson(Map<String, dynamic> json){
    return Empleado(
      nombre: json["nombre"],
      id: json["id"]
    );
  }
}