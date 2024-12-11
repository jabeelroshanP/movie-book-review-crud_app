import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:review_crud/model/student.dart';

ValueNotifier<List<Model>> modelNotifier = ValueNotifier([]);

Future addMoviestolist(Model value) async {
  final ModelDb = await Hive.openBox<Model>('save_data');
  ModelDb.add(value);
 getAllModel();
}

Future getAllModel() async {
  final ModelDb = await Hive.openBox<Model>('save_data');
  modelNotifier.value.clear();
  modelNotifier.value.addAll(ModelDb.values);
  modelNotifier.notifyListeners();
}

Future deleteModel(int index) async {
  final ModelDb = await Hive.openBox<Model>('save_data');
  ModelDb.deleteAt(index);
  getAllModel();
}

Future<void> editing(index, Model value) async {
  final ModelDb = await Hive.openBox<Model>('save_data');
  ModelDb.putAt(index, value);
  getAllModel();
}
 