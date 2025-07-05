import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgr/support/styles/app_colors.dart';

import '../../support/services/injector/injector.dart';
import '../../support/styles/app_fonts.dart';
import 'bloc/login_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bloc = injector.get<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        bloc: bloc,
        listener: (_, state) {},
        builder: (_, state) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [AppColors.green, AppColors.yellow],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Container(color: AppColors.black02)),
                      ],
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.business, color: AppColors.white),
                                      SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('NOME DA EMPRESA', style: AppFonts.nunito(fontSize: 16)),
                                          Text('NOME DA EMPRESA', style: AppFonts.nunito(fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Text('Bem-vindo!', style: AppFonts.nunito(fontSize: 26, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 4),
                                  Text(
                                    'Aqui você gerencia seus clientes e produtos',
                                    style: AppFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(height: 12),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Center(
                                child: UnconstrainedBox(
                                  constrainedAxis: Axis.horizontal,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.black03,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    bloc.add(LoginFormChanged(loginForm: LoginForm.login));
                                                  },
                                                  child: IntrinsicWidth(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'Entrar',
                                                          style: AppFonts.nunito(
                                                            fontSize: 24,
                                                            fontColor: state.loginForm == LoginForm.login
                                                                ? AppColors.green
                                                                : AppColors.white,
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: state.loginForm == LoginForm.login,
                                                          child: Container(
                                                            height: 1.5,
                                                            color: state.loginForm == LoginForm.login
                                                                ? AppColors.green
                                                                : AppColors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 16),
                                                GestureDetector(
                                                  onTap: () {
                                                    bloc.add(LoginFormChanged(loginForm: LoginForm.register));
                                                  },
                                                  child: IntrinsicWidth(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'Cadastrar',
                                                          style: AppFonts.nunito(
                                                            fontSize: 24,
                                                            fontColor: state.loginForm == LoginForm.register
                                                                ? AppColors.green
                                                                : AppColors.white,
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: state.loginForm == LoginForm.register,
                                                          child: Container(
                                                            height: 1.5,
                                                            color: state.loginForm == LoginForm.register
                                                                ? AppColors.green
                                                                : AppColors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 32),
                                            TextFormField(
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                label: Text('CPF', style: AppFonts.nunito(fontSize: 18)),
                                                contentPadding: EdgeInsets.all(16),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(40),
                                                  borderSide: BorderSide(color: AppColors.white),
                                                ),
                                                errorText: null,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            TextFormField(
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                label: Text('Senha', style: AppFonts.nunito(fontSize: 18)),
                                                contentPadding: EdgeInsets.all(16),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(40),
                                                  borderSide: BorderSide(color: AppColors.white),
                                                ),
                                                errorText: null,
                                              ),
                                            ),
                                            SizedBox(height: 24),
                                            Row(
                                              children: [
                                                SizedBox.square(
                                                  dimension: 24,
                                                  child: Checkbox(value: true, onChanged: (_) {}),
                                                ),
                                                SizedBox(width: 4),
                                                Expanded(
                                                  child: Text('Lembrar senha', style: AppFonts.nunito(fontSize: 15)),
                                                ),
                                                SizedBox(width: 12),
                                                Expanded(
                                                  child: Text(
                                                    'Esqueceu a senha?',
                                                    textAlign: TextAlign.end,
                                                    style: AppFonts.nunito(
                                                      fontSize: 15,
                                                      fontColor: AppColors.green,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 24),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: -42,
                                        child: Container(
                                          width: 84,
                                          height: 84,
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(color: AppColors.black03, shape: BoxShape.circle),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                colors: [AppColors.green, AppColors.yellow],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              ),
                                            ),
                                            child: Icon(Icons.arrow_forward),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(height: 16),
                                  Text('EMPRESA', style: AppFonts.nunito(fontSize: 20)),
                                  SizedBox(height: 16),
                                  Text('Acesse através das redes sociais', style: AppFonts.nunito(fontSize: 16)),
                                  SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.facebook, color: AppColors.white),
                                      SizedBox(width: 16),
                                      Icon(Icons.facebook, color: AppColors.white),
                                      SizedBox(width: 16),
                                      Icon(Icons.facebook, color: AppColors.white),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
