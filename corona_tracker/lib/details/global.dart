import 'package:flutter/material.dart';

class GlobalStats extends StatelessWidget {

  final Map globalData;

  const GlobalStats({Key key, this.globalData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          GlobalStatus(
            title: 'CONFIRMED',
            gridColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: globalData['cases'].toString(),
            countColor: Colors.blue[500],
          ),
          GlobalStatus(
            title: 'ACTIVE',
            gridColor: Colors.grey[200],
            textColor: Colors.grey[700],
            count: globalData['active'].toString(),
            countColor: Colors.grey[500],
          ),
          GlobalStatus(
            title: 'RECOVERED',
            gridColor: Colors.green[100],
            textColor: Colors.green[900],
            count: globalData['recovered'].toString(),
            countColor: Colors.green[700],
          ),
          GlobalStatus(
            title: 'DEATHS',
            gridColor: Colors.red[100],
            textColor: Colors.red,
            count: globalData['deaths'].toString(),
            countColor: Colors.red[500],
          ),
        ],
      ),
    );
  }
}


class GlobalStatus extends StatelessWidget {
  final Color gridColor;
  final Color textColor;
  final Color countColor;
  final String title;
  final String count;

  const GlobalStatus(
      {Key key, this.gridColor, this.textColor, this.countColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(5),
      height: 40,
      width: 20,
      color: gridColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: countColor,),
          )
        ],
      ),
    );
  }
}