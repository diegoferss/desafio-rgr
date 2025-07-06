import 'package:webview_flutter/webview_flutter.dart';

class WebviewState {
  final bool isLoading;
  final String url;
  final WebViewController? controller;

  WebviewState({required this.url, this.isLoading = false, this.controller});

  WebviewState copyWith({bool? isLoading, String? url, WebViewController? controller}) {
    return WebviewState(
      url: url ?? this.url,
      isLoading: isLoading ?? this.isLoading,
      controller: controller ?? this.controller,
    );
  }
}
