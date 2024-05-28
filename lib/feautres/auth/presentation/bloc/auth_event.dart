import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.emailChanged({required String emailVal}) =
      EmailChangeEvent;

  const factory AuthEvent.passwordChanged({required String passwordVal}) =
      PasswordChangedEvent;

  const factory AuthEvent.userNameChanged({required String userNameVal}) =
      UserNameChangedEvent;

  const factory AuthEvent.loginEmailChanged({required String emailVal}) =
      LoginEmailChangeEvent;

  const factory AuthEvent.forgotPasswordEmailonChanged(
      {required String emailVal}) = ForgotPasswordEmailChangeEvent;

  const factory AuthEvent.loginPasswordChanged({required String passwordVal}) =
      LoginPasswordChangedEvent;

  const factory AuthEvent.fullName({required String fullName}) =
      FullNameChangedEvent;

  const factory AuthEvent.countryChanged({required String countryVal}) =
      CountryChangedEvent;

  const factory AuthEvent.register() = RegisterEvent;

  const factory AuthEvent.onchangeOtpVal({required String valOtp}) =
      OtpValidationEvent;
  const factory AuthEvent.verifyOtp() = VerifyOtpEvent;

  const factory AuthEvent.resendOtp() = ResendOtpEvent;
  const factory AuthEvent.logout() = LogoutEvent;
  const factory AuthEvent.login() = LoginEvent;
  const factory AuthEvent.forgotPassword() = ForgortPasswordSendEmailEvent;

  const factory AuthEvent.newpasswordChanged({required String newpasswordVal}) =
      NewPasswordChangedEvent;
  const factory AuthEvent.confirmnewpasswordChanged(
      {required String confirmnewpasswordVal}) = ConfirmNewPasswordChangedEvent;
  const factory AuthEvent.completeforgotPassword() =
      CompleteForgortPasswordEvent;

  const factory AuthEvent.veryEmail() = VerifyEmailEvent;

  const factory AuthEvent.dashboard() = DashboardEvent;
}
