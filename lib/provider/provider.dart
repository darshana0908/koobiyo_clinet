import 'dart:ui';
import 'dart:ui';

import 'package:client_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../UI/SenderUI/drawer/dashbord/dashbord.dart';

class ProviderS with ChangeNotifier {
  Color _pb2 = white;
  Color get pb2 => _pb2;

  set pb2(Color i) {
    _pb2 = i;
    notifyListeners();
  }

  int _tileIndex = 10;
  int get tileIndex => _tileIndex;

  set tileIndex(int i) {
    _tileIndex = i;
    notifyListeners();
  }

  int _currentWidget = 1;
  int get currentWidget => _currentWidget;

  set currentWidget(int i) {
    _currentWidget = i;
    notifyListeners();
  }

  Widget _selectedWidet = DashBoard();
  Widget get selectedWidet => _selectedWidet;

  set selectedWidet(Widget i) {
    _selectedWidet = i;
    notifyListeners();
  }
}

// task--------------------------------------------------