import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_app/src/core/cubit/generic_state.dart';
import 'package:works_app/src/features/types_pets/domain/entities/pets_entity.dart';
import 'package:works_app/src/features/types_pets/domain/usecases/pets_usecase.dart';

class TypePetsCubit extends Cubit<GenericState> {
  late PetsUseCase petsUseCase;

  TypePetsCubit(this.petsUseCase) : super(InitState());

  PetsEntity? productEntity;
  late List<PetsEntity>? listDogsEntity;
  late List<PetsEntity>? listCatsEntity;
  List<PetsEntity> searchProductEntity = [];

  Future<void> getPets() async {
    emit(LoadingState());
    searchProductEntity = [];
    listDogsEntity = await petsUseCase.dogs();
    listCatsEntity = await petsUseCase.cats();
    if (listDogsEntity != null || listCatsEntity != null) {
      if (listDogsEntity != null) {
        for (var element in listDogsEntity!) { element.type = 'D'; searchProductEntity.add(element);}
      }
      if (listCatsEntity != null) {
        for (var element in listCatsEntity!) { element.type = 'C'; searchProductEntity.add(element);}
      }
      Future.delayed(Duration(seconds: 3), ()=>emit(SuccessState()));
    }
    if (listDogsEntity == null || listCatsEntity == null) {
      emit(ErrorState());
    }
  }

  void setCats() {
    emit(LoadingState());
    searchProductEntity = [];
    if (listCatsEntity != null) {
      searchProductEntity = listCatsEntity!;
    }
    Future.delayed(Duration(seconds: 1), ()=>emit(SuccessState()));
  }

  void setDogs() {
    emit(LoadingState());
    searchProductEntity = [];
    if (listDogsEntity != null) {
      searchProductEntity = listDogsEntity!;
    }
    Future.delayed(Duration(seconds: 1), ()=>emit(SuccessState()));
  }
}
