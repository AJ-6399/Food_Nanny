import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_app/JSONTEST/jsondatamodel.dart';
import 'package:to_do_app/toppicks.dart';

int? postId;
String? postName;
String? userEmail;
int id = 1;
Future<void> getJsonData() async {
  var respone = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/comments/$id"));
  var body = respone.body;
  FetchJson data = FetchJson.fromJson(jsonDecode(body));
  postName = data.name;
  userEmail = data.email;
  postId = data.id;
  print(userEmail);
}
