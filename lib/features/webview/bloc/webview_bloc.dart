import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'webview_events.dart';
import 'webview_state.dart';

class WebviewBloc extends Bloc<WebviewEvents, WebviewState> {
  WebviewBloc({required String url}) : super(WebviewState(url: url)) {
    on<WebviewLoadUrlRequested>(_onWebviewLoadUrlRequested);
  }

  FutureOr<void> _onWebviewLoadUrlRequested(WebviewLoadUrlRequested event, Emitter<WebviewState> emit) async {
    emit(state.copyWith(isLoading: true));

    final controller = WebViewController();

    await controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    await controller.loadRequest(Uri.parse(state.url));

    emit(state.copyWith(controller: controller, isLoading: false));
  }
}
