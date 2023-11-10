import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:works_app/src/core/cubit/generic_state.dart';
import 'package:works_app/src/features/description_pets/presentation/cubit/description_pets_cubit.dart';
import 'package:works_app/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:works_app/src/features/types_pets/presentation/cubit/type_pets_cubit.dart';
import 'package:works_app/src/shared/utils/loading_component.dart';
import 'package:works_ds/widget/bottom/bottom.dart';
import 'package:works_ds/widget/texte_form_field/ec_text_form_field.dart';
import 'package:works_ds/works_ds.dart';

class TypePetsPage extends StatefulWidget {
  const TypePetsPage({super.key});

  @override
  State<TypePetsPage> createState() => _TypePetsPageState();
}

class _TypePetsPageState extends State<TypePetsPage> {
  TextEditingController searchController = TextEditingController();

  late final TypePetsCubit cubit;
  late final LoginCubit loginCubit;
  late final DescriptionPetsCubit cubitDescription;

  @override
  void initState() {
    super.initState();
    cubit = Modular.get<TypePetsCubit>();
    cubitDescription = Modular.get<DescriptionPetsCubit>();
    loginCubit = Modular.get<LoginCubit>();
    cubit.getPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.colorFeedbackInformationDark,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'pets'.i18n(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: InkWell(
          onTap: () => loginCubit.logout(),
          child: const Icon(
            Icons.power_settings_new,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: BlocBuilder(
        builder: (context, state) {
          if (state is SuccessState) {
            return cubit.searchProductEntity.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: CustomSizes.sizeXXS,
                      vertical: CustomSizes.sizeM,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ECTextFormField(
                          controller: searchController,
                          icon: Icon(
                            Icons.search,
                            color: CustomColor.colorFeedbackInformationDark,
                          ),
                          hintText: 'search'.i18n(),
                          onChanged: (value) {
                            //cubit.setSearchList(value);
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ECBottom(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  onTap: () {
                                    cubit.setCats();
                                  },
                                  text: 'cats'.i18n(),
                                ),
                                ECBottom(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  onTap: () {
                                    cubit.setDogs();
                                  },
                                  text: 'dogs'.i18n(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ECBottom(
                            width: MediaQuery.of(context).size.width / 1.2,
                            onTap: () {
                              cubit.getPets();
                            },
                            text: 'all'.i18n(),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'pets'.i18n(),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cubit.searchProductEntity.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: cubit.searchProductEntity[index].type == 'D' ? (){
                                  cubitDescription.getDog(cubit.searchProductEntity[index].id.toString());
                                } : (){
                                  cubitDescription.getCat(cubit.searchProductEntity[index].id.toString());
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                      child: SizedBox(
                                        height: MediaQuery.of(context).size.height *
                                            0.35,
                                        width: MediaQuery.of(context).size.height *
                                            0.45,
                                        child: Image.network(
                                          cubit.searchProductEntity[index].url ??
                                              CustomIconsConst.notFoundImage,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ECTextFormField(
                          controller: searchController,
                          icon: Icon(
                            Icons.search,
                            color: CustomColor.colorFeedbackInformationDark,
                          ),
                          hintText: 'search'.i18n(),
                          onChanged: (value) {
                            //cubit.setSearchList(value);
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ECBottom(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  onTap: () {
                                    cubit.setCats();
                                  },
                                  text: 'cats'.i18n(),
                                ),
                                ECBottom(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  onTap: () {
                                    cubit.setDogs();
                                  },
                                  text: 'dogs'.i18n(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ECBottom(
                            width: MediaQuery.of(context).size.width / 1.2,
                            onTap: () {
                              cubit.getPets();
                            },
                            text: 'all'.i18n(),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Text(
                          'pet'.i18n(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        const Expanded(
                          child: Center(
                            child: Text('Item indisponível'),
                          ),
                        ),
                      ],
                    ),
                  );
          }
          if (state is LoadingState) {
            return getLoading(context);
          }
          return const SizedBox();
        },
        bloc: cubit,
      ),
    );
  }
}
