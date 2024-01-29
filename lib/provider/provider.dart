import 'dart:io';
import 'dart:ui';
import 'dart:ui';

import 'package:client_app/UI/reciverUI/drawer/dashbord/ReceiverDashBoard.dart';
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

  String _type = 'NIC';
  String get type => _type;

  set type(String i) {
    _type = i;
    notifyListeners();
  }

  File? _nicFront;
  File get nicFront => _nicFront!;

  set nicFront(File i) {
    _nicFront = i;
    notifyListeners();
  }

  File? _nicBack;
  File get nicBack => _nicBack!;

  set nicBack(File i) {
    _nicBack = i;
    notifyListeners();
  }

  File? _brCopy;
  File get brCopy => _brCopy!;

  set brCopy(File i) {
    _brCopy = i;
    notifyListeners();
  }

  Widget _selectedWidet = DashBoard();
  Widget get selectedWidet => _selectedWidet;

  set selectedWidet(Widget i) {
    _selectedWidet = i;
    notifyListeners();
  }

  Widget _receiverSelectWidget = ReceiverDashBoard();
  Widget get receiverSelectWidget => _receiverSelectWidget;

  set receiverSelectWidget(Widget i) {
    _receiverSelectWidget = i;
    notifyListeners();
  }
}

// task--------------------------------------------------