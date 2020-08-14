import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'search.dart';

class Countrydetails extends StatefulWidget {
  @override
  _CountrydetailsState createState() => _CountrydetailsState();
}

class _CountrydetailsState extends State<Countrydetails> {
  List countryData;
  getCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    getCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            
            showSearch(context: context, delegate: Search(countryData));


          },),
        ],
        title: Text('Country Stats'),
      ),
      body: countryData == null
          ? Center(
              child: LinearProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                                  child: Container(
                    height: 120,
                    margin: EdgeInsets.symmetric(vertical:10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.red[100],
                            blurRadius: 20,
                            offset: Offset(0, 10))
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal:10),
                          child: Column(  
                            crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(countryData[index]['country'],
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              Image.network(
                                countryData[index]['countryInfo']['flag'],
                                height: 70,
                                width: 60,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'CONFIRMED: ' +
                                    countryData[index]['cases'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              Text(
                                'ACTIVE: ' +
                                    countryData[index]['active'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              Text(
                                'RECOVERED: ' +
                                    countryData[index]['recovered'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Text(
                                'DEATHS: ' +
                                    countryData[index]['deaths'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
