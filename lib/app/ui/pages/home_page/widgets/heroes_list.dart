import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:heroes/app/controllers/home_controller.dart';
import 'package:heroes/app/data/models/heroesModel.dart';

class HeroesList extends StatelessWidget {
  const HeroesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => ListView.builder(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        itemCount: _.listHeroes.length,
        itemBuilder: (__, index) {
          final HeroesModel hero = _.listHeroes[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 8.0,
              child: ListTile(
                onTap: () {
                  _.showHeroDetail(hero);
                },
                title: Text(hero.name),
                subtitle: Text(hero.slug),
                leading: Semantics(
                  enabled: true,
                  label: 'Imagens dos Herois',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: hero.images.lg,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                trailing: Semantics(
                  label: 'Genero do heroi',
                  child: Text(hero.appearance.gender.toString()),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
