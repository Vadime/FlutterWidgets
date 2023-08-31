import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/controllers/toast_controller.dart';
import 'package:widgets/widgets.dart';

class ToastPage extends StatelessWidget {
  final ThemeConfig config;
  const ToastPage(this.config, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToastController, ToastData>(
      bloc: ToastController(),
      builder: (context, state) {
        if (!state.animation.value && state.animation.completed ||
            state.message == null) {
          return const SizedBox();
        } else {
          return IgnorePointer(
            ignoring: true,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              opacity: state.animation.value ? 1 : 0,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: CardWidget.single(
                      backgroundColor: config.primaryColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: config.padding,
                        vertical: config.paddingH,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: config.paddingD,
                        vertical: config.padding,
                      ).safe(context),
                      child: TextWidget(
                        state.message!,
                        color: Colors.white,
                        align: TextAlign.center,
                        weight: FontWeight.bold,
                      ),
                    )),
              ),
            ),
          );
        }
      },
    );
  }
}
