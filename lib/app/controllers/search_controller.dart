import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroes/app/controllers/home_controller.dart';
import 'package:heroes/app/data/models/heroesModel.dart';
import 'package:heroes/app/routes/app_route.dart';

class SearchController extends GetxController {
  final _homeController = Get.find<HomeController>();

  List<HeroesModel> _filtered = [];

  List<HeroesModel> get filteredList => _filtered;

  set setFilteredList(List<HeroesModel> h) {
    _filtered = h;
  }

  TextEditingController _textController = TextEditingController();
  TextEditingController get textController => _textController;

  @override
  void onReady() {
    super.onReady();
    filteredHeroList(textController.text);
  }

  @override
  void onClose() {
    super.onClose();
    textController.clear();
  }

  showHeroDetail(HeroesModel heroes) {
    Get.toNamed(AppRoute.DETAIL, arguments: heroes);
  }

  filteredHeroList(String text) {
    if (text.trim().isNotEmpty) {
      this.setFilteredList = _homeController.listHeroes
          .where((h) => h.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    } else {
      Get.snackbar(
        'Aviso',
        'preencha o campo de Texto',
        colorText: Colors.teal,
        backgroundColor: Colors.grey[900],
        icon: Icon(Icons.arrow_circle_down_outlined),
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    update();
  }
}
