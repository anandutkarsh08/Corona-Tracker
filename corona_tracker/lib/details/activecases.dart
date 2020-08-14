import 'package:flutter/material.dart';

class ActiveCases extends StatelessWidget {
  final List countryData;

  const ActiveCases({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: <Widget>[
                Text(
                  countryData[index]['country'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Active: ' + countryData[index]['active'].toString(),
                  style:
                      TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}