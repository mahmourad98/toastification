import 'package:flutter/material.dart';
import 'package:toastification/src/core/style/toastification_theme.dart';
import 'package:toastification/src/widget/built_in/close_button.dart';

abstract class ToastWidget extends StatelessWidget {
  const ToastWidget({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.showCloseButton = true,
    this.showProgressBar = false,
    this.closeButton = const ToastCloseButton(),
    required this.onCloseTap,
    this.progressBarValue,
    this.progressBarWidget,
  });

  final bool showCloseButton, showProgressBar;
  final Widget? title, description, icon;
  final ToastCloseButton closeButton;
  final VoidCallback onCloseTap;
  
  final double? progressBarValue;
  final Widget? progressBarWidget;

  BoxConstraints get constraints => const BoxConstraints(minHeight: 64,);

  Widget buildBody(ToastificationTheme toastTheme,);

  Widget getDefaultIcon(ToastificationTheme toastTheme) {
    return Icon(
      toastTheme.icon,
      size: 24,
      color: toastTheme.foreground ?? toastTheme.iconColor,
    );
  }
}
