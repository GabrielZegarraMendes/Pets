import 'package:works_app/src/features/description_pets/domain/entities/description_pets_entity.dart';

abstract class DescriptionPetsRepository {
  Future<DescriptionPetsEntity?> getDescriptionCats(String id);
  Future<DescriptionPetsEntity?> getDescriptionDogs(String id);
}