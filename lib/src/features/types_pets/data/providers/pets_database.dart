import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:works_app/src/features/types_pets/data/models/pets_model.dart';
import 'package:works_app/src/features/types_pets/data/repositorys/pets_repository.dart';
import 'package:works_app/src/features/types_pets/domain/entities/pets_entity.dart';

import 'package:http/http.dart' as http;
import 'package:works_app/src/shared/utils/const.dart';

class PetsDatasourceImpl implements PetsRepositoryImpl {
  @override
  Future<List<PetsEntity>?> getDogs() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      final response;
      List<PetsModel>? result;
      response = await http.get(
        Uri.parse('${apiUrlDogs}images/search?limit=100'),
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        result = jsonData.map((json) => PetsModel.fromJson(json)).toList();
        return result;
      } else {
        throw Exception(
            'Falha na solicitação HTTP com código de status ${response.statusCode}',);
      }
      return result;
    } catch (e) {
      print('Erro dog: $e');
    }
    return null;
  }

  @override
  Future<List<PetsEntity>?> getCats() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      final response;
      List<PetsModel>? result;
      response = await http.get(
        Uri.parse('${apiUrlCats}images/search?limit=100'),
        headers: {
          'x-api-key':
              'live_VAJtPKwDHlhiYYFPRZldGtRCMEmJbDYGyz3FtSJLSOgjz3EkZxs8ZBAWLrFkllhG',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        result = jsonData.map((json) => PetsModel.fromJson(json)).toList();
        return result;
      } else {
        throw Exception(
            'Falha na solicitação HTTP com código de status ${response.statusCode}',);
      }
      return result;
    } catch (e) {
      print('Erro cat: $e');
    }
    return null;
  }
}
