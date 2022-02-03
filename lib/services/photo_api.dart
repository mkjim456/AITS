import 'dart:convert';
import 'package:flutter_application_1/model/photo_model.dart';
import 'package:http/http.dart' as http;

class api_service {
  final Url = "https://picsum.photos/v2/list";
  final client = http.Client();

  Future<List<photo>> getPhoto() async {
    final uri = Uri.parse(Url);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['id'];
    List<photo> id = body.map((dynamic item) => photo.fromJson(item)).toList();
    return getPhoto();
  }
}
