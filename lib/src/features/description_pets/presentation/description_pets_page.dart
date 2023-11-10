import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:works_app/src/core/cubit/generic_state.dart';
import 'package:works_app/src/features/description_pets/presentation/cubit/description_pets_cubit.dart';
import 'package:works_app/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:works_app/src/shared/utils/loading_component.dart';
import 'package:works_ds/widget/texte_form_field/ec_text_form_field.dart';
import 'package:works_ds/works_ds.dart';

class DescriptionPetsPage extends StatefulWidget {
  const DescriptionPetsPage({super.key});

  @override
  State<DescriptionPetsPage> createState() => _DescriptionPetsPageState();
}

class _DescriptionPetsPageState extends State<DescriptionPetsPage> {
  TextEditingController searchController = TextEditingController();

  late final DescriptionPetsCubit cubit;
  late final LoginCubit loginCubit;

  @override
  void initState() {
    super.initState();
    cubit = Modular.get<DescriptionPetsCubit>();
    loginCubit = Modular.get<LoginCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.colorFeedbackInformationDark,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'pet'.i18n(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: InkWell(
          onTap: () => Modular.to.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: BlocBuilder(
        builder: (context, state) {
          if (state is SuccessState) {
            return cubit.descriptionPetsEntity != null
                ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CustomSizes.sizeXXS,
                  vertical: CustomSizes.sizeM,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height *
                            0.40,
                        child: Text(
                          cubit.descriptionPetsEntity!.breeds != null ? cubit.descriptionPetsEntity!.breeds!.first.name! : '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.35,
                        width: MediaQuery.of(context).size.height *
                            0.45,
                        child: Image.network(
                          cubit.descriptionPetsEntity!.url ??
                              CustomIconsConst.notFoundImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height *
                            0.45,
                        child: Text(
                          '${'temperament'.i18n()}:',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height *
                            0.45,
                        child: Text(
                          cubit.descriptionPetsEntity!.breeds != null ? cubit.descriptionPetsEntity!.breeds!.first.temperament! : '',
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height *
                            0.45,
                        child: Text(
                          '${'group'.i18n()}:',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height *
                            0.45,
                        child: Text(
                          cubit.descriptionPetsEntity!.breeds != null ? cubit.descriptionPetsEntity!.breeds!.first.breedGroup! : '',
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
