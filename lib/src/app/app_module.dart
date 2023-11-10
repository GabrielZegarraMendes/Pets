import 'package:flutter_modular/flutter_modular.dart';
import 'package:works_app/src/features/description_pets/data/providers/description_pets_database.dart';
import 'package:works_app/src/features/description_pets/data/repositorys/description_pets_repository.dart';
import 'package:works_app/src/features/description_pets/domain/usecases/description_pets_usecase.dart';
import 'package:works_app/src/features/description_pets/presentation/cubit/description_pets_cubit.dart';
import 'package:works_app/src/features/description_pets/presentation/description_pets_page.dart';
import 'package:works_app/src/features/login/data/providers/auth_database.dart';
import 'package:works_app/src/features/login/data/repositorys/login_repository.dart';
import 'package:works_app/src/features/login/domain/usecases/login_usecase.dart';
import 'package:works_app/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:works_app/src/features/types_pets/data/providers/pets_database.dart';
import 'package:works_app/src/features/types_pets/data/repositorys/pets_repository.dart';
import 'package:works_app/src/features/types_pets/domain/usecases/pets_usecase.dart';
import 'package:works_app/src/features/types_pets/presentation/cubit/type_pets_cubit.dart';
import 'package:works_app/src/features/types_pets/presentation/type_pets_page.dart';
import '../features/login/presentation/login_page.dart';

class AppModule extends Module {

  @override
  List<Bind> get binds => [
        //Bind((i) => SplashCubit()),
        Bind.singleton((i) => LoginCubit(i.get())),
        Bind((i) => LoginDatasourceImpl()),
        Bind((i) => LoginRepositoryImpl()),
        Bind((i) => LoginUseCaseImpl(i.get())),
        Bind.singleton((i) => TypePetsCubit(i.get())),
        Bind((i) => PetsDatasourceImpl()),
        Bind((i) => PetsRepositoryImpl()),
        Bind((i) => PetsUseCaseImpl(i.get())),
        Bind.singleton((i) => DescriptionPetsCubit(i.get())),
        Bind((i) => DescriptionPetsDatasourceImpl()),
        Bind((i) => DescriptionPetsRepositoryImpl()),
        Bind((i) => DescriptionPetsUseCaseImpl(i.get())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const LoginPage(),),
    ChildRoute('${Modular.initialRoute}pets',
        child: (context, args) => const TypePetsPage(),),
    ChildRoute('${Modular.initialRoute}description',
      child: (context, args) => const DescriptionPetsPage(),),
  ];
}
