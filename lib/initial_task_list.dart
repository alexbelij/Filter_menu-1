import 'package:filter_menu/task.dart';
import 'package:flutter/material.dart';


List<Task> tasks = [
  new Task(
      name: "Monitor the Tesseract",
      category: "Avengers",
      time: "5pm",
      color: Colors.orange,
      completed: false),
  new Task(
      name: "Run backup",
      category: "Avengers: Ago of Ultron",
      time: "3pm",
      color: Colors.cyan,
      completed: true),
  new Task(
      name: "Team Captain",
      category: "Captain America:Civil War",
      time: "2pm",
      color: Colors.pink,
      completed: false),
  new Task(
      name: "Monitor Mjölnir",
      category: "Thor",
      time: "12pm",
      color: Colors.cyan,
      completed: true),
  new Task(
      name: "Teem Meeting",
      category: "Hangouts",
      time: "10am",
      color: Colors.cyan,
      completed: true),
];