import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_pay/core/app/smart_model.dart';
import 'package:smart_pay/core/enum/smart_pay_enum.dart';
import 'package:smart_pay/feautres/auth/data/model/signup_resp_model.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    @Default(SmartPayAppState.intital) SmartPayAppState createNewPasswordStatus,
    @Default('') String newPassword,
    @Default('') String confirmNewPassword,
    @Default(SmartPayAppState.intital) SmartPayAppState forgotPasswordStatus,
    @Default('') String emailForgetPasswordCtrl,
    @Default(SmartPayAppState.intital) SmartPayAppState signUpEmailStatus,
    @Default(SmartPayAppState.intital) SmartPayAppState loginStatus,
    @Default(SmartPayAppState.intital) SmartPayAppState logoutStatus,
    @Default('') String emailCtrl,
    @Default('') String fullName,
    @Default('') String firstName,
    @Default('') String lasttName,
    @Default('') String userName,
    @Default('') String country,
    @Default('') String password,
    @Default('') String dashboardSecretMessage,
    @Default(SmartPayAppState.intital) SmartPayAppState dashboardStatus,
    @Default('') String otpCode,
    @Default(false) bool obscure,
    @Default('') String exceptionError,
    SmartPayModel? verifyEmailRespModel,
    @Default(SmartPayAppState.intital) SmartPayAppState verifyEmailStatus,
    @Default(SmartPayAppState.intital) SmartPayAppState verifyOtpStatus,
    SmartPayModel? signUpRespModel,
    User? usersSignUpModel,
    @Default(SmartPayAppState.intital) SmartPayAppState signUpStatus,

    ///
    ///
    ///
    ///
  }) = _AuthState;
  bool get loginBool => emailCtrl.isNotEmpty && password.isNotEmpty;
  bool get emailBool => emailCtrl.isNotEmpty;
  bool get signupBool =>
      fullName.isNotEmpty && country.isNotEmpty && password.isNotEmpty;
  bool get verificationBool => otpCode.isNotEmpty;
  bool get completeForgotPassword =>
      newPassword.isNotEmpty && confirmNewPassword.isNotEmpty;

  const AuthState._();
}
