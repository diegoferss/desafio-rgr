import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rgr/support/services/injector/injector.dart';

import '../../router/mobile_router.dart';
import '../../support/styles/app_colors.dart';
import 'bloc/splash_bloc.dart';
import 'bloc/splash_events.dart';
import 'bloc/splash_state.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final bloc = injector.get<SplashBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(SplashSessionVerifyRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      bloc: bloc,
      listener: _viewStateListener,
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.green, AppColors.yellow],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.people, size: 128, color: AppColors.white),
                    const SizedBox(height: 20),
                    Text(
                      'RGR',
                      style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _viewStateListener(BuildContext context, SplashState state) {
    return switch (state) {
      SplashInitial() => null,
      SplashSessionVerified(:final isLoggedIn) => _onSessionVerified(isLoggedIn),
    };
  }

  void _onSessionVerified(bool isLoggedIn) {
    if (isLoggedIn) {
      context.goNamed(MobileRouter.home);
    } else {
      context.goNamed(MobileRouter.login);
    }
  }
}
