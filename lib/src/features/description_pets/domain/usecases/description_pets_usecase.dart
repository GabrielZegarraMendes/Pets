
import 'package:works_app/src/features/description_pets/domain/entities/description_pets_entity.dart';
import 'package:works_app/src/features/description_pets/domain/repositorys/description_pets_repository.dart';

abstract class DescriptionPetsUseCase {
  Future<DescriptionPetsEntity?> dogs(String id);
  Future<DescriptionPetsEntity?> cats(String id);
}

class DescriptionPetsUseCaseImpl implements DescriptionPetsUseCase{

  final DescriptionPetsRepository repository;
  DescriptionPetsUseCaseImpl(this.repository);

  @override
  Future<DescriptionPetsEntity?> dogs(String id) async{
    var result = await repository.getDescriptionDogs(id);
    return result;
  }

  @override
  Future<DescriptionPetsEntity?> cats(String id) async{
    var result = await repository.getDescriptionCats(id);
    return result;
  }
}