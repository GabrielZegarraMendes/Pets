import 'package:works_app/src/features/types_pets/domain/entities/pets_entity.dart';

abstract class PetsRepository {
  Future<List<PetsEntity>?> getCats();
  Future<List<PetsEntity>?> getDogs();
}