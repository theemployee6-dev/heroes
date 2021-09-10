import 'package:get/get.dart';
import 'package:heroes/app/data/models/heroesModel.dart';

class DetailController extends GetxController {
  HeroesModel _heroesDetail;
  HeroesModel get heros => _heroesDetail;

  @override
  void onInit() {
    super.onInit();
    argumentFromHomePage();
  }

  argumentFromHomePage() {
    this._heroesDetail = Get.arguments as HeroesModel;
  }
}
