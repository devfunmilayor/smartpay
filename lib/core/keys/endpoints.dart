class Endpoints {
  Endpoints._();
  // receiveTimeout
  static const int receiveTimeout = 15000;
  // connectTimeout
  static const int connectionTimeout = 15000;
}

class _Onboarding {
  final signup = 'auth/register';
  final login = 'auth/login';
  final verifyEmail = 'auth/email/verify';
  final getToken = 'auth/email';
  final logout = 'auth/logout';
  final home = 'dashboard';
}

final onboarding = _Onboarding();
