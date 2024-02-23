import 'package:flutter/widgets.dart';

class Notifier with ChangeNotifier{

  void refreshPage(){
    notifyListeners();
  }

}