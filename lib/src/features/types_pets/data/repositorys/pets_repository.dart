import 'package:works_app/src/features/types_pets/domain/entities/pets_entity.dart';
import 'package:works_app/src/features/types_pets/domain/repositorys/pets_repository.dart';

class PetsRepositoryImpl extends PetsRepository {
  @override
  Future<List<PetsEntity>?> getCats() async {
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }

  @override
  Future<List<PetsEntity>?> getDogs() async {
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }
}