import '../database/task_database.dart';
import '../models/task.dart';

class TaskRepository {
  final _db = TaskDatabase.instance;

  Future<List<Task>> getTasks() async {
    final db = await _db.database;
    final result = await db.query('tasks');
    return result.map((e) => Task.fromMap(e)).toList();
  }

  Future<void> addTask(Task task) async {
    final db = await _db.database;
    await db.insert('tasks', task.toMap());
  }
}
