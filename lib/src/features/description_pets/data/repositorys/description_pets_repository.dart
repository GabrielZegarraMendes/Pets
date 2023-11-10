import 'package:works_app/src/features/description_pets/domain/entities/description_pets_entity.dart';
import 'package:works_app/src/features/description_pets/domain/repositorys/description_pets_repository.dart';

class DescriptionPetsRepositoryImpl extends DescriptionPetsRepository {
  @override
  Future<DescriptionPetsEntity?> getDescriptionCats(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return null;
  }

  @override
  Future<DescriptionPetsEntity?> getDescriptionDogs(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return null;
  }
}