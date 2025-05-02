import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_test_calismasi/constants/urls.dart';
import 'package:flutter_test_calismasi/model/character_model.dart';

class CharacterService {
  final Dio _dio = Dio();

  Future<List<CharacterModel>?> fetchCharacters() async {
    try {
      var response = await _dio.get(
        Urls.apiUrl,
      );
      log('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        List<CharacterModel> characterList = jsonList
            .map((jsonItem) => CharacterModel.fromJson(jsonItem))
            .toList();
        return characterList;
      } else {
        log("Error code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      log("Error: $e");
      return null;
    }
  }
}
