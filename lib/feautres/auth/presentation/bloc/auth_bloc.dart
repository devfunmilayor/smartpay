import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_pay/core/db/preference_store.dart';
import 'package:smart_pay/core/enum/smart_pay_enum.dart';
import 'package:smart_pay/core/keys/pref_keys.dart';
import 'package:smart_pay/core/usecases/smart_pay_no_params.dart';

import 'package:smart_pay/core/util/device.dart';
import 'package:smart_pay/feautres/auth/data/model/device.dart';
import 'package:smart_pay/feautres/auth/data/model/signup_resp_model.dart';
import 'package:smart_pay/feautres/auth/domain/usecase/auth_usecase.dart';
import 'package:smart_pay/feautres/auth/presentation/bloc/auth_event.dart';
import 'package:smart_pay/feautres/auth/presentation/bloc/auth_state.dart';

@lazySingleton
class AuthBloc extends StateNotifier<AuthState> {
  final SignUpUsecase signUpUsecase;
  final LoginUsecase loginUsecase;
  final VerifyEmaiilUsecase verifyEmailUsecase;
  final VerifyOtplUsecase verifyOtplUsecase;
  final LogoutUsecase logoutUsecase;
  final GetDashBoardUsecase getDashBoardUsecase;

  AuthBloc(
    this.signUpUsecase,
    this.loginUsecase,
    this.verifyOtplUsecase,
    this.verifyEmailUsecase,
    this.logoutUsecase,
    this.getDashBoardUsecase,
  ) : super(AuthState());

  cleanFieldText() => state = state.copyWith(
        signUpStatus: SmartPayAppState.intital,
        verifyEmailStatus: SmartPayAppState.intital,
        verifyOtpStatus: SmartPayAppState.intital,
        loginStatus: SmartPayAppState.intital,
        forgotPasswordStatus: SmartPayAppState.intital,
        firstName: '',
        lasttName: '',
        fullName: '',
        emailCtrl: '',
        password: '',
        otpCode: '',
      );

  setPasswordVisibility() => state = state.copyWith(
      verifyOtpStatus: SmartPayAppState.intital,
      signUpStatus: SmartPayAppState.intital,
      verifyEmailStatus: SmartPayAppState.intital,
      loginStatus: SmartPayAppState.intital,
      obscure: !state.obscure);

  void mapEventsToState(AuthEvent authEvent) async {
    authEvent.map(
        emailChanged: (EmailChangeEvent value) {
          RegExp regExp = RegExp(
              r"(^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z])");
          if (value.emailVal.toString().isNotEmpty &&
              regExp.hasMatch(value.emailVal)) {
            state = state.copyWith(
              createNewPasswordStatus: SmartPayAppState.intital,
              forgotPasswordStatus: SmartPayAppState.intital,
              signUpEmailStatus: SmartPayAppState.intital,
              dashboardStatus: SmartPayAppState.intital,
              verifyOtpStatus: SmartPayAppState.intital,
              logoutStatus: SmartPayAppState.intital,
              signUpStatus: SmartPayAppState.intital,
              verifyEmailStatus: SmartPayAppState.intital,
              emailCtrl: value.emailVal,
              loginStatus: SmartPayAppState.intital,
            );
          } else {
            state = state.copyWith(
                verifyEmailStatus: SmartPayAppState.intital, emailCtrl: '');
          }
        },
        passwordChanged: (PasswordChangedEvent value) {
          RegExp regex = RegExp(
              r'^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$');
          String p = value.passwordVal.trim();

          if (p.isEmpty && p.length < 6 && !regex.hasMatch(p)) {
            state = state.copyWith(
                verifyOtpStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital,
                password: '');
          } else {
            state = state.copyWith(
                verifyOtpStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital,
                password: value.passwordVal);
          }
        },
        loginEmailChanged: (LoginEmailChangeEvent value) {},
        forgotPasswordEmailonChanged: (ForgotPasswordEmailChangeEvent value) {
          RegExp regExp = RegExp(
              r"(^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z])");
          if (value.emailVal.toString().isNotEmpty &&
              regExp.hasMatch(value.emailVal)) {
            state = state.copyWith(
                forgotPasswordStatus: SmartPayAppState.intital,
                verifyOtpStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                emailForgetPasswordCtrl: value.emailVal,
                loginStatus: SmartPayAppState.intital);
          } else {
            state = state.copyWith(
                forgotPasswordStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                emailForgetPasswordCtrl: '');
          }
        },
        loginPasswordChanged: (LoginPasswordChangedEvent value) {},
        fullName: (FullNameChangedEvent value) {
          if (value.fullName.toString().isNotEmpty &&
              value.fullName.length > 5) {
            state = state.copyWith(
                verifyOtpStatus: SmartPayAppState.intital,
                logoutStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital,
                fullName: value.fullName);
            List<String> parts = state.fullName.split(' ');
            String firstName = parts[0];
            String lastName =
                parts.length > 1 ? parts.sublist(1).join(' ') : '';

            state = state.copyWith(firstName: firstName, lasttName: lastName);
          } else {
            state = state.copyWith(
              fullName: '',
              verifyOtpStatus: SmartPayAppState.intital,
              signUpStatus: SmartPayAppState.intital,
              verifyEmailStatus: SmartPayAppState.intital,
              loginStatus: SmartPayAppState.intital,
            );
          }
        },
        countryChanged: (CountryChangedEvent value) {
          String c = value.countryVal.trim();
          if (c.isNotEmpty) {
            state = state.copyWith(
                verifyOtpStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital,
                country: value.countryVal);
          } else {
            state = state.copyWith(
                verifyOtpStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital,
                country: '');
          }
        },
        register: (RegisterEvent value) async {
          state = state.copyWith(
              logoutStatus: SmartPayAppState.intital,
              forgotPasswordStatus: SmartPayAppState.intital,
              verifyOtpStatus: SmartPayAppState.intital,
              signUpStatus: SmartPayAppState.submissionInProgress,
              verifyEmailStatus: SmartPayAppState.intital,
              loginStatus: SmartPayAppState.intital);

          String? deviceName;

          try {
            final DeviceInfoModel deviceInfo = await getCompleteDeviceInfo();
            deviceName = deviceInfo.deviceName ?? 'Unknown';
          } catch (e) {
            state = state.copyWith(
              signUpStatus: SmartPayAppState.submissionFailure,
            );
          }

          var payload = {
            "full_name": state.fullName,
            "username": state.country,
            "email": state.emailCtrl,
            "country": state.country,
            "password": state.password,
            "device_name": deviceName
          };

          print('Payload: $payload');

          final resp = await signUpUsecase(payload);

          resp.fold(
              (l) => state = state.copyWith(
                  signUpStatus: SmartPayAppState.submissionFailure,
                  exceptionError: l.message), (r) {
            final data = r.data as Map<String, dynamic>;
            final user = User.fromJson(data['user'] as Map<String, dynamic>);
            final token = data['token'] as String;

            state = state.copyWith(
              signUpStatus: SmartPayAppState.submissionSuccess,
              exceptionError: r.responseMessage,
              usersSignUpModel: user,
            );

            sharedPrefUtils.setString(key: PrefKeys.AUTH_TOKEN, value: token);
          });
        },
        onchangeOtpVal: (OtpValidationEvent value) {
          print('Otp: ${value.valOtp}');
          if (value.valOtp.length < 5) {
            state = state.copyWith(
                otpCode: '',
                verifyOtpStatus: SmartPayAppState.intital,
                forgotPasswordStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital);
          } else {
            state = state.copyWith(
                verifyOtpStatus: SmartPayAppState.intital,
                otpCode: value.valOtp,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital);
          }
        },
        verifyOtp: (VerifyOtpEvent value) async {
          state = state.copyWith(
              otpCode: state.otpCode.trim(),
              verifyOtpStatus: SmartPayAppState.submissionInProgress,
              signUpStatus: SmartPayAppState.intital,
              forgotPasswordStatus: SmartPayAppState.intital,
              verifyEmailStatus: SmartPayAppState.intital,
              loginStatus: SmartPayAppState.intital);

          var payload = {"email": state.emailCtrl, "token": state.otpCode};
          print('Payload: $payload');
          final resp = await verifyOtplUsecase(payload);

          resp.fold(
              (l) => state = state.copyWith(
                  verifyOtpStatus: SmartPayAppState.submissionFailure,
                  exceptionError: l.message),
              (r) => state = state.copyWith(
                  verifyEmailStatus: SmartPayAppState.intital,
                  loginStatus: SmartPayAppState.intital,
                  verifyOtpStatus: SmartPayAppState.submissionSuccess,
                  verifyEmailRespModel: r));
        },
        resendOtp: (ResendOtpEvent value) {},
        logout: (LogoutEvent value) async {
          state = state.copyWith(
            logoutStatus: SmartPayAppState.submissionInProgress,
          );

          final resp = await logoutUsecase(NoParams());
          resp.fold(
              (l) => state = state.copyWith(
                  exceptionError: l.message,
                  logoutStatus: SmartPayAppState.submissionFailure), (r) {
            sharedPrefUtils.removeKey(PrefKeys.AUTH_TOKEN);
            sharedPrefUtils.clearAll();
            state = state.copyWith(
                logoutStatus: SmartPayAppState.submissionSuccess,
                loginStatus: SmartPayAppState.intital,
                dashboardStatus: SmartPayAppState.intital,
                usersSignUpModel: null,
                exceptionError: r.responseMessage);
          });
        },
        login: (LoginEvent value) async {
          state = state.copyWith(
              logoutStatus: SmartPayAppState.intital,
              forgotPasswordStatus: SmartPayAppState.intital,
              verifyOtpStatus: SmartPayAppState.intital,
              signUpStatus: SmartPayAppState.intital,
              verifyEmailStatus: SmartPayAppState.intital,
              loginStatus: SmartPayAppState.submissionInProgress);
          String? deviceName;
          try {
            final DeviceInfoModel deviceInfo = await getCompleteDeviceInfo();
            deviceName = deviceInfo.deviceName ?? 'Unknown';
          } catch (e) {
            state = state.copyWith(
              loginStatus: SmartPayAppState.submissionFailure,
            );
          }
          var payload = {
            "email": state.emailCtrl,
            "password": state.password,
            "device_name": deviceName
          };

          print('payload: $payload');

          final loginResp = await loginUsecase(payload);
          loginResp.fold(
              (l) => state = state.copyWith(
                  loginStatus: SmartPayAppState.submissionFailure,
                  exceptionError: l.message), (r) {
            final data = r.data as Map<String, dynamic>;
            final user = User.fromJson(data['user'] as Map<String, dynamic>);
            final token = data['token'] as String;

            state = state.copyWith(
              loginStatus: SmartPayAppState.submissionSuccess,
              exceptionError: r.responseMessage,
              usersSignUpModel: user,
            );

            // Save the token to shared preferences
            sharedPrefUtils.setString(key: PrefKeys.AUTH_TOKEN, value: token);
          });
        },
        forgotPassword: (ForgortPasswordSendEmailEvent value) async {
          if (state.emailForgetPasswordCtrl.isEmpty) {
            return;
          }
          state = state.copyWith(
              forgotPasswordStatus: SmartPayAppState.submissionInProgress,
              verifyOtpStatus: SmartPayAppState.intital,
              signUpStatus: SmartPayAppState.intital,
              verifyEmailStatus: SmartPayAppState.intital,
              loginStatus: SmartPayAppState.intital);
          await Future.delayed(Duration(seconds: 2), () {
            state = state.copyWith(
              forgotPasswordStatus: SmartPayAppState.submissionSuccess,
            );
          });
        },
        completeforgotPassword: (CompleteForgortPasswordEvent value) {},
        veryEmail: (VerifyEmailEvent value) async {
          state = state.copyWith(
              forgotPasswordStatus: SmartPayAppState.intital,
              verifyOtpStatus: SmartPayAppState.intital,
              signUpStatus: SmartPayAppState.intital,
              verifyEmailStatus: SmartPayAppState.submissionInProgress,
              loginStatus: SmartPayAppState.intital);

          var payload = {
            "email": state.emailCtrl,
          };
          print('Payload: $payload');

          final resp = await verifyEmailUsecase(payload);

          resp.fold(
              (l) => state = state.copyWith(
                  verifyEmailStatus: SmartPayAppState.submissionFailure,
                  exceptionError: l.message),
              (r) => state = state.copyWith(
                  verifyOtpStatus: SmartPayAppState.intital,
                  signUpStatus: SmartPayAppState.intital,
                  verifyEmailStatus: SmartPayAppState.submissionSuccess,
                  verifyEmailRespModel: r,
                  otpCode: r.data['token']));
        },
        userNameChanged: (UserNameChangedEvent value) {
          String c = value.userNameVal.trim();
          if (c.isNotEmpty) {
            state = state.copyWith(
                forgotPasswordStatus: SmartPayAppState.intital,
                verifyOtpStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital,
                country: value.userNameVal);
          } else {
            state = state.copyWith(
                verifyOtpStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital,
                country: '');
          }
        },
        newpasswordChanged: (NewPasswordChangedEvent value) {
          RegExp regex = RegExp(
              r'^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$');
          String p = value.newpasswordVal.trim();

          if (p.isEmpty && p.length < 6 && !regex.hasMatch(p)) {
            state = state.copyWith(
                createNewPasswordStatus: SmartPayAppState.intital,
                forgotPasswordStatus: SmartPayAppState.intital,
                verifyOtpStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital,
                newPassword: '');
          } else {
            state = state.copyWith(
                createNewPasswordStatus: SmartPayAppState.intital,
                forgotPasswordStatus: SmartPayAppState.intital,
                verifyOtpStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital,
                newPassword: value.newpasswordVal);
          }
        },
        confirmnewpasswordChanged: (ConfirmNewPasswordChangedEvent value) {
          if (value.confirmnewpasswordVal.toString().isNotEmpty &&
              value.confirmnewpasswordVal.toString() ==
                  state.newPassword.toString()) {
            state = state.copyWith(
                createNewPasswordStatus: SmartPayAppState.intital,
                forgotPasswordStatus: SmartPayAppState.intital,
                verifyOtpStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital,
                confirmNewPassword: value.confirmnewpasswordVal.toString());
          } else {
            state = state.copyWith(
                createNewPasswordStatus: SmartPayAppState.intital,
                forgotPasswordStatus: SmartPayAppState.intital,
                verifyOtpStatus: SmartPayAppState.intital,
                signUpStatus: SmartPayAppState.intital,
                verifyEmailStatus: SmartPayAppState.intital,
                loginStatus: SmartPayAppState.intital,
                confirmNewPassword: '');
          }
        },
        dashboard: (DashboardEvent value) async {
          state = state.copyWith(
              forgotPasswordStatus: SmartPayAppState.intital,
              verifyOtpStatus: SmartPayAppState.intital,
              signUpStatus: SmartPayAppState.intital,
              verifyEmailStatus: SmartPayAppState.intital,
              loginStatus: SmartPayAppState.intital,
              dashboardStatus: SmartPayAppState.submissionInProgress);

          final resp = await getDashBoardUsecase(NoParams());
          resp.fold(
              (l) => state = state.copyWith(
                  exceptionError: l.message,
                  dashboardStatus: SmartPayAppState.submissionFailure),
              (r) => state = state.copyWith(
                  dashboardStatus: SmartPayAppState.submissionSuccess,
                  verifyEmailRespModel: r,
                  dashboardSecretMessage: r.data['secret'] as String));
        });
  }
}
