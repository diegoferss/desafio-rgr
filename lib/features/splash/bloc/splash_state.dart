sealed class SplashState {}

class SplashInitial extends SplashState {}

class SplashSessionVerified extends SplashState {
  final bool isLoggedIn;

  SplashSessionVerified({required this.isLoggedIn});
}
