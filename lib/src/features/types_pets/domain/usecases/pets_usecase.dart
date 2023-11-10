import 'package:works_app/src/features/types_pets/domain/entities/pets_entity.dart';
import 'package:works_app/src/features/types_pets/domain/repositorys/pets_repository.dart';

abstract class PetsUseCase {
  Future<List<PetsEntity>?> dogs();
  Future<List<PetsEntity>?> cats();
}

class PetsUseCaseImpl implements PetsUseCase{

  final PetsRepository repository;
  PetsUseCaseImpl(this.repository);

  @override
  Future<List<PetsEntity>?> dogs() async{
    var result = await repository.getDogs();
    return result;
  }

  @override
  Future<List<PetsEntity>?> cats() async{
    var result = await repository.getCats();
    return result;
  }
}