import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:online_gallery/core/failure.dart';
import 'package:online_gallery/models/photo_model.dart';

class ApiService {
  static final ApiService instance = ApiService._internal();

  ApiService._internal();

  final String _baseUrl = "pixabay.com";
  final String _key = "43656419-2e238f9dfe22420019bf05e17";

  Future<Either<Failure, List<PhotoModel>>> getImages(
      String query, int page) async {
    try {
      var data = {
        'key': _key,
        "q": query.split(' ').join('+'),
        "image_type": "photo",
        'page': page.toString(),
        'per_page': '200'
      };

      var url = Uri.https(_baseUrl, '/api/', data);

      var response = await http.get(url);

      var body = jsonDecode(response.body);

      return Right(
        body['hits']
            .map<PhotoModel>(
              (e) => PhotoModel.fromJson(e),
            )
            .toList(),
      );
    } catch (e) {
      return Left(ApiFailure(msg: e.toString()));
    }
  }
}
