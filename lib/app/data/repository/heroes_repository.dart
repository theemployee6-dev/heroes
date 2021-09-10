import 'package:get/get.dart';
import 'package:heroes/app/data/models/heroesModel.dart';
import 'package:heroes/app/data/provider/HeroesApi.dart';

class HeroesRepository {
  final HeroesApi _api = Get.find<HeroesApi>();

  Future<List<HeroesModel>> requestHeroes() => _api.newRequestHeroes();
}
