import 'dart:io';

import 'package:dio/dio.dart';
import 'package:simple_todo_app/entities/todo.dart';

import '../entities/todo.dart';

class TodoRepo {
  final _dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:3000',
    contentType: 'application/json',
    validateStatus: (_) => true,
  ));
  Future<TodoEntity> createOne(TodoEntity todo) async {
    final res = await _dio.post('/todos', data: todo.toMap());
    if (res.statusCode == HttpStatus.created) {
      return TodoEntity.fromMap(res.data['data']);
    } else {
      print(res.data);
      throw res.data.toString();
    }
  }

  Future<List<TodoEntity>> findMany() async {
    final res = await _dio.get('/todos');
    if (res.statusCode == HttpStatus.ok) {
      final data = <TodoEntity>[];

      res.data['data'].forEach((v) {
        data.add(TodoEntity.fromMap(v));
      });
      return List.from(res.data['data']).map((e) => TodoEntity.fromMap(e)).toList();
    } else {
      throw res.data.toString();
    }
  }

  Future<TodoEntity> updateOne(TodoEntity todo) async {
    final res = await _dio.put('/todos/${todo.id}', data: todo.toMap());
    if (res.statusCode == HttpStatus.ok) {
      return TodoEntity.fromMap(res.data['data']);
    } else {
      throw res.data.toString();
    }
  }

  Future<void> deleteOne(TodoEntity todo) async {
    final res = await _dio.delete('/todos/${todo.id}', data: todo.toMap());
    if (res.statusCode != HttpStatus.ok) {
      throw res.data.toString();
    }
  }
}
