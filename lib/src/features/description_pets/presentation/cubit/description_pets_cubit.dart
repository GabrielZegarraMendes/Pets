import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:works_app/src/core/cubit/generic_state.dart';
import 'package:works_app/src/features/description_pets/domain/entities/description_pets_entity.dart';
import 'package:works_app/src/features/description_pets/domain/usecases/description_pets_usecase.dart';

class DescriptionPetsCubit extends Cubit<GenericState> {
  late DescriptionPetsUseCase descriptionPetsUseCase;

  DescriptionPetsCubit(this.descriptionPetsUseCase) : super(InitState());

  DescriptionPetsEntity? productEntity;
  late DescriptionPetsEntity? descriptionPetsEntity;

  Future<void> getDog(String id) async {
    emit(LoadingState());
    descriptionPetsEntity = await descriptionPetsUseCase.dogs(id);
    if (descriptionPetsEntity != null) {
      Modular.to.pushNamed('/description');
      emit(SuccessState());
    }
    if (descriptionPetsEntity == null) {
      Modular.to.pushNamed('/description');
      emit(ErrorState());
    }
  }

  Future<void> getCat(String id) async {
    emit(LoadingState());
    descriptionPetsEntity = await descriptionPetsUseCase.cats(id);
    if (descriptionPetsEntity != null) {
      Modular.to.pushNamed('/description');
      emit(SuccessState());
    }
    if (descriptionPetsEntity == null) {
      Modular.to.pushNamed('/description');
      emit(ErrorState());
    }
  }

}
