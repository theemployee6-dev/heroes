import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroes/app/ui/utils/app_string.dart';

class PowerStatisCard extends StatelessWidget {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  const PowerStatisCard({
    this.intelligence,
    this.combat,
    this.durability,
    this.power,
    this.speed,
    this.strength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildHeroesInfo(context),
      ),
    );
  }

  _buildHeroesInfo(context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.POWERSTATS_PAGE_TITLE,
            style: GoogleFonts.abrilFatface(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
          Divider(thickness: 2, color: Colors.black),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Intelligence: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  '$intelligence',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 2, color: Colors.black12),
          Row(
            children: [
              Text(
                'Strength: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  '$strength',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 2, color: Colors.black12),
          Row(
            children: [
              Text(
                'Speed: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  '$speed',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 2, color: Colors.black12),
          Row(
            children: [
              Text(
                'Durability: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  '$durability',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 2, color: Colors.black12),
          Row(
            children: [
              Text(
                'Power: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  '$power',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 2, color: Colors.black12),
          Row(
            children: [
              Text(
                'Combat: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  '$combat',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 2, color: Colors.black),
        ],
      ),
    );
  }
}
