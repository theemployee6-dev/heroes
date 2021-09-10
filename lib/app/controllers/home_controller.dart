import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:heroes/app/data/models/heroesModel.dart';
import 'package:heroes/app/data/repository/heroes_repository.dart';
import 'package:heroes/app/routes/app_route.dart';

class HomeController extends GetxController {
  final _repository = Get.find<HeroesRepository>();

  List<HeroesModel> _listHeroes = [];
  List<HeroesModel> get listHeroes => _listHeroes;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    print("onInitHome");
    fetchHeroes();
  }

  Future<void> fetchHeroes() async {
    var dados = await _repository.requestHeroes().timeout(Duration(seconds: 60),
        onTimeout: () {
      throw TimeoutException('Connection Timed Out');
    });
    this._listHeroes = dados;
    this._isLoading = false;
    update();
  }

  showHeroDetail(HeroesModel heroes) {
    Get.toNamed(AppRoute.DETAIL, arguments: heroes);
  }

  showSearchPage(){
    Get.toNamed(AppRoute.SEARCH);
  }

  findRandomHeroes() {
    Random random = Random();
    var index = random.nextInt(listHeroes.length);
    Get.toNamed(AppRoute.DETAIL, arguments: listHeroes[index]);
  }
}
