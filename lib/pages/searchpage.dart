import 'package:app_settings/app_settings.dart';
import 'package:connectivity/connectivity.dart';
import 'package:toast/toast.dart';
import '../widget/cardtiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../widget/networking.dart';
import '../moviemanager/moviemanager.dart';

class MovieSearch extends StatefulWidget {
  @override
  _MovieSearchState createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  NetworkManager apifetecher = new NetworkManager();
  final _textController = TextEditingController();
  bool _isSearch = false;
  bool _iscirle = false;

  getMovieSearch(String moviename) async {
    Provider.of<MovieManager>(context, listen: false).clearDataList();
    setState(() {
      _iscirle = true;
    });
    var data = await apifetecher.getMovieSearchResult(moviename, context);
    Provider.of<MovieManager>(context, listen: false).addListData(data);
    setState(() {
      _iscirle = false;
      _isSearch = true;
    });
  }

  void getConnectivity() async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.wifi ||
        connectivity == ConnectivityResult.mobile) {
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('No Internet Access'),
          content: Icon(
            Icons.signal_wifi_off,
            size: 70.0,
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                AppSettings.openWIFISettings();
              },
              child: Text(
                'N/w Settings',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.purple,
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                onSubmitted: (val) {
                  if (val.isEmpty) {
                    Toast.show('Name is reqired', context,
                        duration: Toast.LENGTH_LONG,
                        gravity: Toast.BOTTOM,
                        textColor: Colors.white70,
                        backgroundColor: Colors.black87);
                  } else {
                    getMovieSearch(val);
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.search),
                    hintText: 'Search',
//                    suffixIcon: IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed: (){},),
                    hintStyle: TextStyle(fontSize: 19.0, color: Colors.black87),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            _isSearch ? yesSearch() : noSearch(),
          ],
        ),
      ),
    );
  }

  Expanded noSearch() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: !_iscirle,
            child: Text(
              'Search for the Movie',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.purple),
            ),
          ),
          Visibility(
              visible: _iscirle,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              )),
        ],
      ),
    );
  }

  Widget yesSearch() {
    var datapart = Provider.of<MovieManager>(context).list;
    return datapart.length == 0
        ? Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CardTiles(datapart[index]);
              },
              itemCount: datapart.length,
              shrinkWrap: true,
            ),
          );
  }
}
