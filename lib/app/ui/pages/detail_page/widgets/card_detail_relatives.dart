import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroes/app/ui/utils/app_string.dart';

class RelativesCard extends StatelessWidget {
  final String relatives;
  final String groupAffiliation;

  const RelativesCard({Key key, this.relatives, this.groupAffiliation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _buildHeroesInfo(context),
    );
  }

  _buildHeroesInfo(context) {
    return SingleChildScrollView(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.RELATIVE_PAGE_TITLE,
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
                    'Relatives: ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '$relatives',
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
                    'Group Affiliation: ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: Text(
                      '$groupAffiliation',
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
