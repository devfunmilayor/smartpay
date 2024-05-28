import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/core/app/smart_pay.dart.dart';
import 'package:smart_pay/core/app/smart_pay_state.dart';
import 'package:smart_pay/core/enum/smart_pay_enum.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';
import 'package:smart_pay/core/route/route.dart';
import 'package:smart_pay/core/shared/rebake_alert_dialog.dart';
import 'package:smart_pay/core/shared/smaert_pay_toast.dart';
import 'package:smart_pay/core/util/screen_extn.dart';
import 'package:smart_pay/feautres/auth/presentation/bloc/auth_event.dart';
import 'package:smart_pay/feautres/auth/presentation/views/login_view.dart';

import 'package:smart_pay/gen/assets.gen.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  refreshFunc() async {
    try {
      await Future.wait([
        ref.read(authBloc.notifier).mapEventsToState(DashboardEvent()),
      ] as Iterable<Future>);
    } catch (e) {
      log('$e');
    }
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) => refreshFunc());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authBloc.select((vaue) => vaue));
    final isLoading = authState.dashboardSecretMessage ==
        SmartPayAppState.submissionInProgress;
    final String secretMessage = authState.dashboardSecretMessage;

    final userFullName = authState.usersSignUpModel?.fullName ?? 'Guest';

    ref.listen(authBloc, (previousState, newState) {
      if (newState.logoutStatus == SmartPayAppState.submissionInProgress) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          },
        );
      } else if (newState.logoutStatus == SmartPayAppState.submissionFailure) {
        ToasResp.errorMessage(newState.exceptionError);
      } else if (newState.logoutStatus == SmartPayAppState.submissionSuccess) {
        RouteConfigKQ.to(page: LoginView());

        return;
      }
    });
    return Scaffold(
        body: Column(children: [
      Container(
        width: double.infinity,
        height: 245,
        decoration: BoxDecoration(
          color: ColorManager.darkPrimary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 24,
            right: 24,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(Assets.png.userPhoto.path, height: 50),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userFullName.length > 30
                            ? '${userFullName.substring(0, 21)}...'
                            : 'Hello, $userFullName',
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '',
                        // merchant.userModel!.displayName.length > 24
                        //     ? '${merchant.userModel!.displayName.substring(0, 21)}...'
                        //     : merchant.userModel!.displayName,
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {},
                        icon: Image.asset(Assets.png.icBell.path, height: 20),
                      ),
                      IconButton(
                        icon: const Icon(Icons.exit_to_app),
                        onPressed: () => showLogoutConfirmationDialog(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Balance',
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '\$12,500,000',
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      Expanded(
          child: Container(
        child: Center(
          child: isLoading
              ? const Text('....................')
              : secretMessage == ''
                  ? const Text('No secret message')
                  : SizedBox(
                      width: context.screenWidth(0.8),
                      child: Text(
                        textAlign: TextAlign.center,
                        '${authState.dashboardSecretMessage}',
                        style: getBoldStyle(color: ColorManager.darkPrimary),
                      ),
                    ),
        ),
      ))
    ]));
  }
}

void showLogoutConfirmationDialog() {
  final c = navigatorKey.currentContext;
  showDialog(
      context: c!,
      builder: (BuildContext context) {
        return Consumer(builder: (context, ref, _) {
          return SmartPayAlertDialog(
            title: 'Are you sure you want to Logout?',
            actionText: 'Logout',
            actionText2: 'Cancel',
            onAction: () {
              Navigator.of(context).pop();
              ref.read(authBloc.notifier).mapEventsToState(LogoutEvent());
            },
            onAction2: () {
              Navigator.of(context).pop();
            },
          );
        });
      });
}
