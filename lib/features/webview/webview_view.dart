import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../support/components/default_app_bar.dart';
import '../../support/services/injector/injector.dart';
import '../../support/styles/app_colors.dart';
import '../../support/styles/app_fonts.dart';
import 'bloc/webview_bloc.dart';
import 'bloc/webview_events.dart';
import 'bloc/webview_state.dart';

class WebviewView extends StatefulWidget {
  final String url;

  const WebviewView({super.key, required this.url});

  @override
  State<WebviewView> createState() => _WebviewViewState();
}

class _WebviewViewState extends State<WebviewView> {
  late final WebviewBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = injector.get<WebviewBloc>(param1: widget.url);
    bloc.add(WebviewLoadUrlRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.green, AppColors.yellow],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BlocBuilder<WebviewBloc, WebviewState>(
          bloc: bloc,
          builder: (_, state) {
            final controller = state.controller;

            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller == null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Não foi possível carregar a página',
                        style: AppFonts.nunito(fontSize: 24, fontColor: AppColors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                        onPressed: () {
                          bloc.add(WebviewLoadUrlRequested());
                        },
                        child: Text(
                          'Tentar novamente',
                          style: AppFonts.nunito(fontSize: 24, fontColor: AppColors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return WebViewWidget(controller: controller);
          },
        ),
      ),
    );
  }
}
