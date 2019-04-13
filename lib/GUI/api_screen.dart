import 'dart:async';
import 'dart:convert';
import 'package:rest_api/GUI/inner_photos.dart';
import 'package:rest_api/GUI/text.dart';
import 'package:rest_api/model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';



class Home extends StatefulWidget {
  @override
  _MainFetchDataState createState() => _MainFetchDataState();
}

class _MainFetchDataState extends State<Home> {

  List<Root> list = List();
  var isLoading = false;
String api_key = "NewsArchive";

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
    await http.get("https://alkafeel.net/alkafeelApps/arabicApp/apiExecuter.php?api=${api_key}", headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Root.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" شبكة الكفيل "),
          backgroundColor: Colors.green[600],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: new Text("انقر لطلب الاخبار"),
            onPressed: _fetchData,
          ),
        ),
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: new Text(list[index].title+'\n'+list[index].date,style: TextStyle(fontWeight: FontWeight.bold),),

                leading:
                GestureDetector(
                  onTap: () => navigateToTextView(context, list[index] ),

                  child: Text("اقرأ المزيد",style: TextStyle(color: Colors.green[600],fontWeight: FontWeight.bold),),

                ),


                subtitle: CachedNetworkImage(

                  imageUrl: list[index].main_photo,
                  fit: BoxFit.fitWidth,
                  width: 180.0,

                ),

                  trailing: Text('${list[index].hits} views',
                      
                    style: TextStyle(
                      color: Colors.green[600],
                      fontSize: 10.0,
                    ),),

                 onTap:  () => _navigateToInnerphotos(context, list[index] )
              );
            }),
    drawer: Drawer(),
    );
  }


  void _navigateToInnerphotos(BuildContext context,Root root) async {

    await Navigator.push(context,

      MaterialPageRoute(builder: (context) => Innerphotos(root)),
    );

  }


  void navigateToTextView(BuildContext context,Root root) async {

    await Navigator.push(context,

      MaterialPageRoute(builder: (context) => Textview(root)),
    );

  }


}