import 'package:flutter/material.dart';

import '../../../../config/local/cache_helper.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with TickerProviderStateMixin {
  List<dynamic> onBoardingdata = [
    {
      "text": "Welcome , Let’s go !",
      'title': 'Discover the weather in your city and plan your day correctly'
    },
    {"text": "check real_time weather", 'title': 'get potential weather'},
    {"text": "Get the weather and stay safe", 'title': ''},
  ];

  late final AnimationController _controller;

  late final Animation<double> _animation;

  int _currentIndex = 0;

  final PageController _pageController = PageController();

  void _nextPage() {
    // next with animation if less than length
    if (_currentIndex < onBoardingdata.length - 1) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(reverse: false);

    _animation = Tween<double>(begin: 2.0, end: 1.5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView
          PageView.builder(
            controller: _pageController,
            itemCount: onBoardingdata.length,
            onPageChanged: (int index) {
              _controller.value = 0.0;
              _currentIndex = index;
              _controller.forward();
              setState(() {});
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // text ====>>>
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Color(0xff015B49),
                          Color(0xff002A34),
                          Color(0xff00162A),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyFadeAnimation(
                          delay: 3,
                          child: Text(
                            onBoardingdata[index]['text'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              height: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyFadeAnimation(
                          delay: 5,
                          child: Text(
                            onBoardingdata[index]['title'],
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),

                        // next button ====>>>
                        MyFadeAnimation(
                          delay: 7,
                          child: _currentIndex == onBoardingdata.length - 1
                              ? Align(
                                  alignment: Alignment.bottomRight,
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    onPressed: () {
                                      CacheHelper.setBoolean(
                                              key: 'OnBoardingView',
                                              value: true)
                                          .then((value) =>
                                              Navigator.pushReplacementNamed(
                                                  context, Routes.homeView));
                                    },
                                    color: AppColors.btncolor,
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                      start: 30,
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    child: SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Get Started',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: AppColors.iconinbtncolor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                40,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.bottomRight,
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    onPressed: () {
                                      _nextPage();
                                    },
                                    color: AppColors.btncolor,
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                      start: 30,
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    child: SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Row(
                                        children: [
                                          Text(
                                            _currentIndex ==
                                                    onBoardingdata.length - 1
                                                ? 'Get Started'
                                                : 'Next',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: AppColors.iconinbtncolor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                40,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // number of pages and current page 1/3 text
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: AlignmentDirectional.topEnd,
              child: Text(
                '${_currentIndex + 1}/${onBoardingdata.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// for animation
class MyFadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;

  const MyFadeAnimation({
    super.key,
    required this.delay,
    required this.child,
  });

  @override
  State<MyFadeAnimation> createState() => _MyFadeAnimationState();
}

class _MyFadeAnimationState extends State<MyFadeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _translateYAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _translateYAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    Future.delayed(Duration(milliseconds: (200 * widget.delay).round()), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.translate(
            offset: _translateYAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
