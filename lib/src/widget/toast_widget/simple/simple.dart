import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:toastification/src/core/context_ext.dart';
import 'package:toastification/src/core/style/toastification_theme.dart';
import 'package:toastification/toastification.dart';

import '../toast_widget.dart';

class SimpleToastWidget extends ToastWidget {
  const SimpleToastWidget({
    super.key,
    super.title,
    super.description,
    super.icon,
    required super.onCloseTap,
    super.showCloseButton,
    super.showProgressBar,
    super.closeButton,
    super.progressBarValue,
    super.progressBarWidget,
  });

  @override Widget build(BuildContext context) {
    return Directionality(
      textDirection: context.toastTheme.direction,
      child: IconTheme(
        data: Theme.of(context).primaryIconTheme.copyWith(color: context.toastTheme.iconColor),
        child: Center(child: buildBody(context.toastTheme)),
      ),
    );
  }

  @override Widget buildBody(ToastificationTheme toastTheme,) {
    Widget body = Container(
      decoration: BoxDecoration(
        color: toastTheme.decorationColor,
        border: toastTheme.decorationBorder,
        boxShadow: toastTheme.boxShadow,
        borderRadius: toastTheme.borderRadius,
      ),
      padding: toastTheme.padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: BuiltInContent(
              title: title ?? const SizedBox(),
            ),
          ),
          const SizedBox(width: 12),
          ToastCloseButtonHolder(
            showCloseButton: showCloseButton,
            onCloseTap: onCloseTap,
            toastCloseButton: closeButton,
          ),
        ],
      ),
    );

    if (toastTheme.applyBlurEffect) {
      body = ClipRRect(
        borderRadius: toastTheme.borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: body,
        ),
      );
    }

    return body;
  }
}
