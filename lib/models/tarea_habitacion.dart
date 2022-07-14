class TareaHabitacion{

  final int id;
  final int task_room_id;
  bool realizado;
  String observaciones;
  final String taskName;
  final String typeTaskName;

  TareaHabitacion({
    required this.id,
    required this.task_room_id,
    required this.realizado,
    required this.observaciones,
    required this.taskName,
    required this.typeTaskName,
  });

  factory TareaHabitacion.fromJson(Map<String, dynamic> json){
    return TareaHabitacion(
        id: json["id"],
        task_room_id: json["task_room_id"],
        realizado: json["realizado"] == 0 ? false : true,
        observaciones: json["observaciones"] ?? "",
        taskName: json["taskName"],
        typeTaskName: json["typeTaskName"]


    );
  }

}