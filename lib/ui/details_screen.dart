import 'package:flutter/material.dart';
import 'package:test_devsteam/models/data.dart';

class DetailsScreen extends StatelessWidget {
  final Urls urls;
  const DetailsScreen(this.urls, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: NetworkImage(urls.full)),
    );
  }
}
