import 'package:flutter/cupertino.dart';

class ProgressBarProvider extends ChangeNotifier {
  double _progress = 0;
  double get progress => _progress;
  
  setProgress(progress) {
    _progress = (300 * progress) / 809;
    notifyListeners();
  }
}