// ignore_for_file: library_private_types_in_public_api

import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckAnimation extends StatefulWidget {
  const CheckAnimation({super.key});

  @override
  _CheckAnimationState createState() => _CheckAnimationState();
}

class _CheckAnimationState extends State<CheckAnimation> {
  double _containerSize = 50;
  bool _animateCheck = false;
  bool _isDialogOpen = true;

  @override
  void initState() {
    super.initState();
    _startRepeatedAnimation();
  }

  void _startRepeatedAnimation() async {
    while (_isDialogOpen) {
      setState(() {
        _containerSize = 60;
        _animateCheck = false;
      });

      await Future.delayed(const Duration(milliseconds: 500));

      if (!_isDialogOpen) break;

      setState(() {
        _containerSize = 50;
        _animateCheck = true;
      });

      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: _containerSize,
        height: _containerSize,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(55),
        ),
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: _animateCheck ? 1.0 : 0.0),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: const Icon(
                  Icons.check,
                  size: 36,
                  color: MyColors.premiumColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _isDialogOpen = false;
    super.dispose();
  }
}

void showCheckDialog(BuildContext context) {
  showDialog(
    context: context,
    // barrierDismissible: false,
    builder: (context) => BlocProvider.value(
      value: BlocProvider.of<NavigationCubit>(context),
       
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 39, 76, 124).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 40),
                      const SizedBox(height: 60, child: CheckAnimation()),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const ShapeDecoration(
                                shape: OvalBorder(), color: Colors.white),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const ShapeDecoration(
                                shape: OvalBorder(), color: Colors.white),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Container(
                            width: 15,
                            height: 15,
                            decoration: const ShapeDecoration(
                                shape: OvalBorder(), color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            context.read<NavigationCubit>().navigateTo(10);
                          },
                          child: Text(
                            "Done",
                            style: AppStyle.styleBold20(context).copyWith(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 25),
                          )),
                    ],
                  ),
                ),
              ),
            );
        },
      ),
    ),
  );
}
