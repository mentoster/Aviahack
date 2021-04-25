import 'package:flutter/material.dart';

class Commands {
  Map cmd = new Map();
  Commands() {
    // commands
    cmd["да"] = "Заполнил вашу информацию!";
  }
  String getAnswer(String query) {
    try {
      return cmd[query];
    } catch (e) {
      return "";
    }
  }
}
