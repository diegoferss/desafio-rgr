import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rgr/support/styles/app_colors.dart';

import '../../router/mobile_router.dart';
import '../../support/components/error_dialog.dart';
import '../../support/components/svg_viewer.dart';
import '../../support/enums/form_submission_status.dart';
import '../../support/services/injector/injector.dart';
import '../../support/styles/app_fonts.dart';
import '../../support/styles/svg_asset.dart';
import 'bloc/login_bloc.dart';
import 'components/auth_button.dart';

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
        listener: _viewStateListener,
        listenWhen: (previous, current) => previous.status != current.status,
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
                                                AuthButton(
                                                  text: 'Entrar',
                                                  isSelected: state.loginForm == LoginForm.login,
                                                  onTap: () {
                                                    bloc.add(LoginFormChanged(loginForm: LoginForm.login));
                                                  },
                                                ),
                                                SizedBox(width: 16),
                                                AuthButton(
                                                  text: 'Cadastrar',
                                                  isSelected: state.loginForm == LoginForm.register,
                                                  onTap: () {
                                                    bloc.add(LoginFormChanged(loginForm: LoginForm.register));
                                                  },
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 32),
                                            TextFormField(
                                              enabled: state.status != FormSubmissionStatus.inProgress,
                                              obscureText: false,
                                              style: AppFonts.nunito(fontSize: 18),
                                              decoration: InputDecoration(
                                                label: Text('Email', style: AppFonts.nunito(fontSize: 18)),
                                                contentPadding: EdgeInsets.all(16),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(40),
                                                  borderSide: BorderSide(color: AppColors.white),
                                                ),
                                                errorText: state.email.displayError?.getErrorMessage(),
                                              ),
                                              onChanged: (value) {
                                                bloc.add(LoginCPFChanged(cpf: value));
                                              },
                                            ),
                                            SizedBox(height: 8),
                                            TextFormField(
                                              enabled: state.status != FormSubmissionStatus.inProgress,
                                              obscureText: true,
                                              style: AppFonts.nunito(fontSize: 18),

                                              decoration: InputDecoration(
                                                label: Text('Senha', style: AppFonts.nunito(fontSize: 18)),
                                                contentPadding: EdgeInsets.all(16),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(40),
                                                  borderSide: BorderSide(color: AppColors.white),
                                                ),
                                                errorText: state.password.displayError?.getErrorMessage(),
                                              ),
                                              onChanged: (value) {
                                                bloc.add(LoginPasswordChanged(password: value));
                                              },
                                            ),
                                            if (state.loginForm == LoginForm.register) ...[
                                              SizedBox(height: 8),
                                              TextFormField(
                                                style: AppFonts.nunito(fontSize: 18),
                                                enabled: state.status != FormSubmissionStatus.inProgress,

                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  label: Text('Confirmar senha', style: AppFonts.nunito(fontSize: 18)),
                                                  contentPadding: EdgeInsets.all(16),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(40),
                                                    borderSide: BorderSide(color: AppColors.white),
                                                  ),
                                                  errorText: state.confirmPassword.displayError?.getErrorMessage(),
                                                ),
                                                onChanged: (value) {
                                                  bloc.add(LoginConfirmPasswordChanged(confirmPassword: value));
                                                },
                                              ),
                                            ],
                                            SizedBox(height: 24),
                                            Row(
                                              children: [
                                                SizedBox.square(
                                                  dimension: 24,
                                                  child: Checkbox(
                                                    shape: CircleBorder(),
                                                    activeColor: AppColors.green,
                                                    value: state.rememberPassword,
                                                    onChanged: (_) {
                                                      bloc.add(LoginRememberPasswordChanged());
                                                    },
                                                  ),
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
                                          child: GestureDetector(
                                            onTap: state.canSubmit
                                                ? () {
                                                    bloc.add(LoginSubmitted());
                                                  }
                                                : null,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(
                                                  colors: [AppColors.green, AppColors.yellow],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                              ),
                                              child: state.status == FormSubmissionStatus.inProgress
                                                  ? Center(child: CircularProgressIndicator(color: AppColors.white))
                                                  : Icon(Icons.arrow_forward),
                                            ),
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
                                      SvgViewer(
                                        asset: SvgAsset.icGoogle,
                                        color: AppColors.white,
                                        height: 24,
                                        width: 24,
                                      ),
                                      SizedBox(width: 16),
                                      Icon(Icons.facebook, color: AppColors.white),
                                      SizedBox(width: 16),
                                      SvgViewer(asset: SvgAsset.icApple, color: AppColors.white, height: 24, width: 24),
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

  void _viewStateListener(BuildContext context, LoginState state) {
    final _ = switch (state.status) {
      FormSubmissionStatus.success => context.goNamed(MobileRouter.home),
      FormSubmissionStatus.initial => null,
      FormSubmissionStatus.inProgress => null,
      FormSubmissionStatus.failure => showDialog(
        context: context,
        builder: (_) {
          return ErrorDialog(error: state.errorType);
        },
      ),
      FormSubmissionStatus.canceled => null,
    };
  }
}
