import 'package:flutter/material.dart';
import 'package:test_devsteam/models/data.dart';
import 'package:test_devsteam/network/webservice.dart';

import 'details_screen.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Data> _dataList = List<Data>();

  @override
  void initState() {
    super.initState();
    _populateMoviesArticles();
  }

  void _populateMoviesArticles() {
    WebService.getListData()
        .then((value) => setState(() => {_dataList = value}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _dataList.length,
          itemBuilder: (BuildContext context, int index) {
            return DataListTile(_dataList[index]).build(context);
          },
        ),
      ),
    );
  }
}

class DataListTile extends StatelessWidget {
  final Data data;
  DataListTile(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(data.urls),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(data.urls.regular),
                height: 200.0,
                fit: BoxFit.cover,
                width: 150.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    data.user.getName(),
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Text(data.user.id),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
