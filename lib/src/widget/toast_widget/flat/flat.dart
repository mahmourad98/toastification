import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toastification/src/core/context_ext.dart';
import 'package:toastification/src/core/style/toastification_theme.dart';
import 'package:toastification/src/widget/built_in/built_in.dart';
import 'package:toastification/src/widget/built_in/close_button.dart';

import '../toast_widget.dart';

class FlatToastWidget extends ToastWidget {
  const FlatToastWidget({
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
        child: buildBody(context.toastTheme),
      ),
    );
  }

  @override
  Widget buildBody(ToastificationTheme toastTheme) {
    Widget body = Container(
      constraints: constraints,
      margin: toastTheme.margin,
      padding: toastTheme.padding,
      decoration: BoxDecoration(
        color: toastTheme.decorationColor,
        borderRadius: toastTheme.borderRadius,
        border: toastTheme.decorationBorder,
        boxShadow: toastTheme.boxShadow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Offstage(
            offstage: !toastTheme.showIcon,
            child: icon ?? getDefaultIcon(toastTheme),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: BuiltInContent(
              title: title,
              description: description,
              progressBarValue: progressBarValue,
              progressBarWidget: progressBarWidget,
            ),
          ),
          const SizedBox(width: 12),
          ToastCloseButtonHolder(
            onCloseTap: onCloseTap,
            showCloseButton: showCloseButton,
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
