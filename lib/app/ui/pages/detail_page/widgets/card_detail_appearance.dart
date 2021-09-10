import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:heroes/app/ui/utils/app_string.dart';

class AppearanceCard extends StatelessWidget {
  final String gender;
  final String race;
  final String eyeColor;
  final String hairColor;
  final String weight;
  final String height;

  const AppearanceCard({
    this.gender,
    this.race,
    this.eyeColor,
    this.hairColor,
    this.weight,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
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
            AppString.APPEARANCE_PAGE_TITLE,
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
              Semantics(
                label: 'Gênero do heroi',
                child: Text(
                  'Gender: ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: Text(
                  '$gender',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 2, color: Colors.black12),
          Semantics(
            label: 'raça do heroi',
            child: Row(
              children: [
                Text(
                  'Race: ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: Text(
                    '$race',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(thickness: 2, color: Colors.black12),
          Semantics(
            label: 'altura do heroi',
            child: Row(
              children: [
                Text(
                  'Height: ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: Text(
                    '$height',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 2, color: Colors.black12),
          Semantics(
            label: 'cor dos olhos do heroi',
            child: Row(
              children: [
                Text(
                  'Eye Color: ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: Text(
                    '$eyeColor',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 2, color: Colors.black12),
          Semantics(
            label: 'Cor do cabelo do heroi',
            child: Row(
              children: [
                Text(
                  'Hair Color: ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: Text(
                    '$hairColor',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 2, color: Colors.black12),
          Semantics(
            label: 'peso do heroi',
            child: Row(
              children: [
                Text(
                  'Weight: ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: Text(
                    '$weight',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Semantics(
            label: 'Linha final do card Appearance',
            child: Divider(thickness: 2, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
