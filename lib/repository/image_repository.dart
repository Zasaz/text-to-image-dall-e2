import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../model/image_generator_model.dart';
import '../utils/app_utils.dart';

class ImageRepository {
  final Ref ref;
  ImageRepository(this.ref);

  Future<ImageGeneratorModel> fetchImageData(
    String imageText,
  ) async {
    Map bodyData = {"prompt": imageText, "n": 6, "size": "256x256"};

    final httpResponse = await http.post(
      Uri.parse("https://api.openai.com/v1/images/generations"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $appKey',
      },
      body: json.encode(bodyData),
    );
    log('Status code: ${httpResponse.statusCode}');
    log('Body Response: ${httpResponse.body}');

    if (httpResponse.statusCode == 200) {
      ImageGeneratorModel imageGeneratorModel = ImageGeneratorModel.fromJson(
        json.decode(httpResponse.body),
      );
      return imageGeneratorModel;
    } else {
      throw 'Nothing';
    }
  }
}
