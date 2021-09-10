
import 'package:get/get.dart';
import 'package:heroes/app/data/models/heroesModel.dart';
import 'package:heroes/app/data/provider/HeroesApi.dart';
import 'package:heroes/app/data/repository/heroes_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HeroesApi>(HeroesApi());
    Get.put<HeroesRepository>(HeroesRepository());
    Get.put<HeroesModel>(HeroesModel());
    Get.put<HomeController>(HomeController());
  }
}
