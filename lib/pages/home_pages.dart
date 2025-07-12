import 'dart:convert';

import 'package:coincap_app/pages/details_page.dart';
import 'package:coincap_app/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  double? _deviceHeight, _deviceWidth;
  String? _selectedCoin = "bitcoin"; // default to correct id;
  HTTPService? _http;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _http = GetIt.instance.get<HTTPService>();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _selectedCoinDropDown(),
              _dataWidgets(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectedCoinDropDown(){
    Map<String, String> _coinMap = {
      "Bitcoin": "bitcoin",
      "Ethereum": "ethereum",
      "Tether": "tether",
      "Cardano": "cardano",
      "Ripple": "ripple",
    };

    List<DropdownMenuItem<String>> _items = _coinMap.keys.map(
          (e) => DropdownMenuItem(
        value: _coinMap[e],
        child: Text(
          e,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ).toList();
    // => will return a value
    return DropdownButton(
      value: _selectedCoin,
      items: _items,
      onChanged: (dynamic _values){
        setState(() {
          _selectedCoin = _values;
        });
      },
      dropdownColor: const Color.fromRGBO(252, 161, 128, 1),
      iconSize: 30,
      icon: const Icon(
        Icons.arrow_drop_down_sharp,
        color: Colors.white,
      ),
      underline: Container(),
    );
  }

  Widget _dataWidgets(){
    return FutureBuilder(
        future: _http!.get('/coins/$_selectedCoin'),
        builder: (BuildContext _context, AsyncSnapshot _snapshot){
          if(_snapshot.hasData){
            Map _data = _snapshot.data!.data;
            num _usdPrice = _data["market_data"]["current_price"]["usd"];
            num _change24h = _data["market_data"]["price_change_percentage_24h"];
            Map _exchangeRates = _data["market_data"]["current_price"];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onDoubleTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext _context){
                          return DetailsPage(rates: _exchangeRates,);
                        },
                        )
                    );
                  },
                  child: _coinImageWidget(
                      _data["image"]["large"]
                  ),
                ),
                _currentPrice(_usdPrice),
                _percentageChangeWidget(_change24h),
                _descriptionCardWidget(_data["description"]["en"])
              ],
            );
          } else{
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        }
    );
  }

  Widget _currentPrice(num _rate){
    return Text(
      "${_rate.toStringAsFixed(2)} USD",
      style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w500
      ),
    );
  }

  Widget _percentageChangeWidget(_change){
    return Text("${_change.toString()} %", style: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w300,
    ),);
  }

  Widget _coinImageWidget(String _imageURL){
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: _deviceHeight!*0.02,
      ),
      height: _deviceHeight!*0.15,
      width: _deviceWidth!*0.15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            _imageURL
          )
        )
      ),
    );
  }

  Widget _descriptionCardWidget(String _description){
    return Container(
      height: _deviceHeight!*0.45,
      width: _deviceWidth!*0.90,
      margin: EdgeInsets.symmetric(
        vertical: _deviceHeight!*0.05,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: _deviceWidth!*0.01,
      ),
      color: const Color.fromRGBO(252, 161, 128, 0.5),
      child: Text(
        _description,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}