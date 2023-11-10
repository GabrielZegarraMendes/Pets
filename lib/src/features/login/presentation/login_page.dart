import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:works_app/src/core/cubit/generic_state.dart';
import 'package:works_app/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:works_app/src/shared/utils/loading_component.dart';
import 'package:works_ds/constants/constants.dart';
import 'package:works_ds/widget/bottom/bottom.dart';
import 'package:works_ds/widget/texte_form_field/ec_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = Modular.get<LoginCubit>();
    cubit.emailController.clear();
    cubit.passwordController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    cubit.emailController.clear();
    cubit.passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        builder: (context, state) {
          if (state is InitState || state is ErrorState) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    SizedBox(
                      height: 100,
                      child: Image.asset(CustomIconsConst.baseAppLogo),
                    ),
                    Text(
                      'login'.i18n(),
                      style: TextStyle(
                        color: CustomColor.colorFeedbackInformationDark,
                        fontSize: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / CustomSizes.sizeM,
                        vertical: MediaQuery.of(context).size.width / CustomSizes.sizeXL,
                      ),
                      child: ECTextFormField(
                        controller: cubit.emailController,
                        hintText: 'E-mail',
                        onChanged: (value) {
                          cubit.validateBottom(
                              cubit.passwordController.text, value,);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / CustomSizes.sizeM,
                      ),
                      child: ECTextFormField(
                        controller: cubit.passwordController,
                        obscureText: true,
                        hintText: 'password'.i18n(),
                        onChanged: (value) {
                          cubit.validateBottom(cubit.emailController.text, value);
                        },
                      ),
                    ),
                    state is ErrorState
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: CustomSizes.sizeXXS),
                            child: SizedBox(
                              height: 40,
                              child: Text(
                                'Email ou senha incorreto.',
                                style: TextStyle(
                                  color: CustomColor.colorFeedbackCriticalDark,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(height: 40),
                    const SizedBox(height: 40),
                    ECBottom(
                      text: 'login'.i18n(),
                      onTap: cubit.validate
                          ? () {
                              cubit.login(
                                cubit.emailController.text,
                                cubit.passwordController.text,
                              );
                            }
                          : null,
                    ),
                  ],
                ),
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
