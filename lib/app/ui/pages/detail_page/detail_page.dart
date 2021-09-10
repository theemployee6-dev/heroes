import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/detail_controller.dart';

import 'package:heroes/app/ui/utils/app_string.dart';

import 'package:heroes/app/ui/pages/detail_page/widgets/headerCurvedContainer.dart';

import 'widgets/card_detail_appearance.dart';
import 'widgets/card_detail_biography.dart';
import 'widgets/card_detail_powerstats.dart';
import 'widgets/card_detail_relatives.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.blueGrey[600],
              title: Row(
                children: [
                  Text(AppString.DETAIL_PAGE_APPBAR_TITLE),
                  SizedBox(width: 10),
                  Text(
                    'ID: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Semantics(
                    onTapHint: 'Id do Heroi',
                    child: Text(_.heros.id.toString()),
                  ),
                ],
              ),
            ),
            body: _buildHeroDetail(),
          ),
        );
      },
    );
  }

  _buildHeroDetail() {
    return GetBuilder<DetailController>(
      builder: (_) => Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              width: Get.width,
              height: Get.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Semantics(
                  label: 'Hero name',
                  child: Text(
                    _.heros.name,
                    style: TextStyle(
                      fontSize: 35.0,
                      letterSpacing: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Hero(
                tag: _.heros,
                child: Semantics(
                  label: 'Imagem do heroi',
                  enabled: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: _.heros.images.lg,
                      height: Get.height * 0.3,
                      width: Get.width * 0.6,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: Get.height * 0.3,
                  width: Get.width,
                  child: PageView(
                    children: [
                      Semantics(
                        label: 'Appearance Card dos Herois',
                        child: AppearanceCard(
                          race: _.heros.appearance.race,
                          eyeColor: _.heros.appearance.eyeColor,
                          gender: _.heros.appearance.gender.toString(),
                          hairColor: _.heros.appearance.hairColor,
                          weight: _.heros.appearance.weight.toString(),
                          height: _.heros.appearance.height.toString(),
                        ),
                      ),
                      Semantics(
                        label: 'biografia dos herois',
                        child: BiographyCard(
                          aliases: _.heros.biography.aliases.toString(),
                          alignment: _.heros.biography.alignment.toString(),
                          alterEgos: _.heros.biography.alterEgos,
                          firstAppearance: _.heros.biography.firstAppearance,
                          placeOfBirth: _.heros.biography.placeOfBirth,
                          publisher: _.heros.biography.publisher,
                        ),
                      ),
                      Semantics(
                        label: 'valores dos poderes dos herois',
                        child: PowerStatisCard(
                          power: _.heros.powerstats.power.toString(),
                          combat: _.heros.powerstats.combat.toString(),
                          durability: _.heros.powerstats.durability.toString(),
                          speed: _.heros.powerstats.speed.toString(),
                          strength: _.heros.powerstats.strength.toString(),
                          intelligence:
                              _.heros.powerstats.intelligence.toString(),
                        ),
                      ),
                      Semantics(
                        label: 'Parentes dos herois',
                        child: RelativesCard(
                          relatives: _.heros.connections.relatives,
                          groupAffiliation:
                              _.heros.connections.groupAffiliation,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
