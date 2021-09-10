import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroes/app/ui/pages/home_page/widgets/heroes_list.dart';
import 'package:heroes/app/ui/utils/app_string.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Semantics(
            label: 'Título da barra superior',
            child: Text(AppString.APP_BAR_TITLE)),
          actions: [
            IconButton(
              onPressed: () {
                _.showSearchPage();
              },
              icon: Semantics(
                label: 'Botão de busca dos herois',
                child: Icon(Icons.search),
              ),
            ),
          ],
        ),
        body: _.isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: Get.height,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 7, child: HeroesList()),
                    _buidRandomButton(),
                  ],
                ),
              ),
      ),
    );
  }

  _buidRandomButton() {
    return GetBuilder<HomeController>(
      builder: (_) => Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              _.findRandomHeroes();
            },
            child: Container(
              height: Get.height * 0.1,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Center(
                child: Semantics(
                  label: 'Botão de busca aleatória',
                  child: Text(
                    "Busca aleatória de Heróis...",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
