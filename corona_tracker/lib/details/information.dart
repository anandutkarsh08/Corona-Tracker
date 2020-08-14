import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              launch('https://www.healthline.com/health/coronavirus-covid-19#prevention');
            },
                      child: Container(
              padding: EdgeInsets.symmetric(vertical:10, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal:10),
              color: Colors.indigo[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('About COVID-19 and its Prevention', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  Icon(Icons.label_important,color: Colors.white)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://covid19.who.int/?gclid=Cj0KCQjwn7j2BRDrARIsAHJkxmwzQUw758alMEi5XKG62DnaL5HHqj9xnDy-Gh2CXkEutuPGH_8Q_wgaAqxkEALw_wcB');
            },
                      child: Container(
              padding: EdgeInsets.symmetric(vertical:10, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical:5, horizontal:10),
              color: Colors.indigo[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('More Info', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  Icon(Icons.label_important,color: Colors.white)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}