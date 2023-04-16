import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List currencies =  getCurrencies() as List;
  
  @override
  Future<void> initState() async {
    super.initState();
    currencies = await getCurrencies();
  }

  Future<List> getCurrencies() async {
    String cryptoUrl = "https://rest.coinapi.io/v1/exchangerate/BTC/EUR?apikey=EEC8C305-A172-4709-8EE0-9F8239BF7CE7";
    http.Response response = await http.get(cryptoUrl);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Tracker'),
        elevation: 3.0,
      ),
      body: _cryptoWidget(

      ),
    );
  }

  Widget _cryptoWidget(){
    return new Container(
      child: new Flexible(
          child: ListView.builder(
            itemCount: 0,
            itemBuilder: (BuildContext context, int index){
              
            },
          ),
      )
    );
  }
}
