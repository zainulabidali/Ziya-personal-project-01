import 'package:flutter/material.dart';

class ChipSelectionProvider extends ChangeNotifier {
  int _selectedChipIndex = 0;

  int get selectedChipIndex => _selectedChipIndex;

  void setChipIndex(int index) {
    _selectedChipIndex = index;
    notifyListeners();
  }
}
