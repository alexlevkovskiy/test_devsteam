import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_devsteam/models/data.dart';

class WebService {
  static final _token =
      '896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043';
  static final _baseUrl = 'https://api.unsplash.com/';

  static String _listDatat() {
    return '$_baseUrl' + 'photos/' + '?client_id=$_token';
  }

  static Future<List<Data>> getListData() async {
    http.Response response = await http.get(Uri.encodeFull(_listDatat()));

    List<dynamic> responseMap = jsonDecode(response.body);
    List<Data> posts = responseMap
        .map(
          (dynamic item) => Data.fromJson(item),
        )
        .toList();

    return posts;
  }
}
