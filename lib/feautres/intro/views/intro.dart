import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/route/route.dart';
import 'package:smart_pay/core/shared/smart_pay_button.dart';
import 'package:smart_pay/core/util/num.dart';
import 'package:smart_pay/feautres/auth/presentation/views/login_view.dart';
import 'package:smart_pay/feautres/intro/widget/intro_widgets.dart';

class IntroWidget extends ConsumerStatefulWidget {
  const IntroWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends ConsumerState<IntroWidget> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      if (_pageController.page != _currentPage) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar:,
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              itemCount: introsx.length,
              itemBuilder: (context, index) => BuildIntroWidget(
                  isIncreaseMargin: index != 3 ? true : false,
                  imgUrl: introsx[index].imgUrl,
                  title: introsx[index].label,
                  subtitle: introsx[index].desc)),
        ),
        Expanded(
          flex: 0,
          child: Container(
            height: MediaQuery.of(context).size.height / 4.0,
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    introsx.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                65.0.h,
                SmartPayButton(
                  color: ColorManager.darkPrimary,
                  text: 'Get Started',
                  onTap: () => RouteConfigKQ.to(page: LoginView()),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      width: _currentPage == index ? 50 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? ColorManager.darkPrimary
            : ColorManager.primary
                .withOpacity(0.2), // Lighter color for inactive dots
        borderRadius: _currentPage == index
            ? BorderRadius.circular(5)
            : BorderRadius.circular(50), // Circle for inactive dots
      ),
    );
  }
}
