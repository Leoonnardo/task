import 'package:sqflite/sqflite.dart';
import 'package:task/model/task_data.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), "tareas1.db"),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE taskUser (idTask INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, description TEXT, status TEXT, dateInitial TEXT, dateFinal TEXT, image BLOB, idUser INTEGER)");
    }, version: 1);
  }

  static Future<void> insert(Task task) async {
    Database database = await _openDB();

    await database.insert("taskUser", task.toMap());
  }
  // DROP DATABASE `login`;

  static Future<void> deleteTask() async {
    Database database = await _openDB();

    database.delete("taskUser");
  }

  static Future<void> delete(Task task) async {
    Database database = await _openDB();

    database.delete("taskUser", where: "idTask = ?", whereArgs: [task.idTask]);
  }

  static Future<void> update(Task task) async {
    Database database = await _openDB();

    await database.update("taskUser", task.toMap(),
        where: "idTask = ?", whereArgs: [task.idTask]);
  }

  static Future<List<Task>> tasks() async {
    Database database = await _openDB();
    try {
      print("Entre");
      final List<Map<String, dynamic>> tasksMap =
          await database.query("taskUser");

      return List.generate(tasksMap.length, (i) {
        // print(tasksMap);
        return Task(
          idTask: tasksMap[i]['idTask'],
          title: tasksMap[i]['title'],
          description: tasksMap[i]['description'],
          status: tasksMap[i]['status'],
          dateInitial: tasksMap[i]['dateInitial'],
          dateFinal: tasksMap[i]['dateFinal'],
          image: tasksMap[i]['image'],
          idUser: tasksMap[i]['idUser'],
        );
      });
    } catch (e) {
      return [];
    }
  }

  static Future<List<Task>> tasksPend(Task task) async {
    Database database = await _openDB();
    try {
      print("Entre");
      final List<Map<String, dynamic>> tasksMap = await database
          .query("taskUser", where: "idUser = ?", whereArgs: [task.idUser]);

      return List.generate(tasksMap.length, (i) {
        Task(
          idTask: tasksMap[i]['idTask'],
          title: tasksMap[i]['title'],
          description: tasksMap[i]['description'],
          status: tasksMap[i]['status'],
          dateInitial: tasksMap[i]['dateInitial'],
          dateFinal: tasksMap[i]['dateFinal'],
          image: tasksMap[i]['image'],
          idUser: tasksMap[i]['idUser'],
        );
        // print(tasksMap);
        if (tasksMap[i]["status"] == "Pendiente") {
          return Task(
            idTask: tasksMap[i]['idTask'],
            title: tasksMap[i]['title'],
            description: tasksMap[i]['description'],
            status: tasksMap[i]['status'],
            dateInitial: tasksMap[i]['dateInitial'],
            dateFinal: tasksMap[i]['dateFinal'],
            image: tasksMap[i]['image'],
            idUser: tasksMap[i]['idUser'],
          );
        } else {
          return Task(
            idTask: tasksMap[i]['idTask'],
            title: tasksMap[i]['title'],
            description: tasksMap[i]['description'],
            status: tasksMap[i]['status'],
            dateInitial: tasksMap[i]['dateInitial'],
            dateFinal: tasksMap[i]['dateFinal'],
            image: tasksMap[i]['image'],
            idUser: tasksMap[i]['idUser'],
          );
        }
      });
    } catch (e) {
      return [];
    }
  }

  // CON SENTENCIAS
  // static Future<void> insertar2(Animal animal) async {
  //   Database database = await _openDB();
  //   var resultado = await database.rawInsert("INSERT INTO animales (id, nombre, especie)"
  //   " VALUES (${animal.id}, ${animal.nombre}, ${animal.especie})");

  // }
}
