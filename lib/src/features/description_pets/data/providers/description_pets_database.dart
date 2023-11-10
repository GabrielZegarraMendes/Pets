import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:works_app/src/features/description_pets/data/models/description_pets_model.dart';
import 'package:works_app/src/features/description_pets/data/repositorys/description_pets_repository.dart';
import 'package:works_app/src/features/description_pets/domain/entities/description_pets_entity.dart';
import 'package:works_app/src/shared/utils/const.dart';

class DescriptionPetsDatasourceImpl implements DescriptionPetsRepositoryImpl {
  @override
  Future<DescriptionPetsEntity?> getDescriptionDogs(String id) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      final response;
      DescriptionPetsModel? result;
      response = await http.get(
        Uri.parse('${apiUrlDogs}images/$id'),
        headers: {
          'x-api-key':
              'live_kwYV3HcIoDhLLMvIkw1hEs5ytxchNP97e80trTEZT8PmwKFWQWfrZ7otiJtK92ID',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        result = DescriptionPetsModel.fromJson(jsonData);
        return result;
      } else {
        throw Exception(
            'Falha na solicitação HTTP com código de status ${response.statusCode}');
      }
    } catch (e) {
      print('Erro de login: $e');
    }
    return null;
  }

  @override
  Future<DescriptionPetsEntity?> getDescriptionCats(String id) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      final response;
      DescriptionPetsModel? result;
      response = await http.get(
        Uri.parse('${apiUrlCats}images/$id'),
        headers: {
          'x-api-key':
              'live_VAJtPKwDHlhiYYFPRZldGtRCMEmJbDYGyz3FtSJLSOgjz3EkZxs8ZBAWLrFkllhG',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        result = DescriptionPetsModel.fromJson(jsonData);
        return result;
      } else {
        throw Exception(
            'Falha na solicitação HTTP com código de status ${response.statusCode}');
      }
    } catch (e) {
      print('Erro de login: $e');
    }
    return null;
  }
}
