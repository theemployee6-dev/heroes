import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroes/app/ui/utils/app_string.dart';

class BiographyCard extends StatelessWidget {
  final String alterEgos;
  final String aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  const BiographyCard({
    this.alterEgos,
    this.aliases,
    this.placeOfBirth,
    this.publisher,
    this.firstAppearance,
    this.alignment,
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
            AppString.BIOGRAPHY_PAGE_TITLE,
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
                'Alter Egos: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  '$alterEgos',
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
                'Alises: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  '$aliases',
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
                'Place of Birth: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  '$placeOfBirth',
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
                'First Appearance: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  '$firstAppearance',
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
                'Publisher: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  '$publisher',
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
                'Alignment: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  '$alignment',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 2, color: Colors.black)
        ],
      ),
    );
  }
}
