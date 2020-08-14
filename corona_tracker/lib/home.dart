import 'dart:convert';
import 'package:corona_tracker/details/activecases.dart';
import 'package:corona_tracker/details/country.dart';
import 'package:corona_tracker/details/global.dart';
import 'package:corona_tracker/details/information.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

Map globalData;
getGlobalStatus() async{
  http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
  setState(() {
    globalData = jsonDecode(response.body); 
  });
} 

List countryData;
  getCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }



Future getData() async{
    getGlobalStatus();
    getCountryData();
  }

@override
  void initState() {
     getData();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Tracker'),
      ),
      body: RefreshIndicator(
        onRefresh: getData,
              child: SingleChildScrollView(child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              alignment: Alignment.center,
              color: Colors.indigo[100],
              child: Text(Data.text, style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.bold, fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Text('Global Cases', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            globalData==null?LinearProgressIndicator():GlobalStats(globalData: globalData),
            SizedBox(height:10),
             
             //Most Active Cases
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Countries with Most Active Cases',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            countryData == null
                ? Container()
                : ActiveCases(
                    countryData: countryData,
                  ),
            SizedBox(height: 10),

            //Country Wise
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Countrydetails()));
              },
                          child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo[50] ,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Country Wise', style: TextStyle(fontSize:15,fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(height:10.0),
            Information(),
            SizedBox(height: 50)
          ],
        )),
      ),
    );
  }
}