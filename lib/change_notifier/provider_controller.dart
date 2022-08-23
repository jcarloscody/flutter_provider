import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/change_notifier/change_notifier_page.dart';

class ProviderController extends ChangeNotifier {
  String name;
  String imgAvatar;
  String birthDate;
  ProviderController({
    required this.name,
    required this.imgAvatar,
    required this.birthDate,
  });

  void alterarDados() {
    name = "nome alterado";
    imgAvatar = "kkkkkk";
    birthDate = "25/99/5566";
    notifyListeners();
  }
}
