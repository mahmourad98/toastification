import 'package:flutter/material.dart';
import 'package:toastification/src/helper/toast_helper.dart';
import 'package:toastification/toastification.dart';

// TODO(payam): rename this class and subclass to something more meaningful - default
abstract class BaseStyle implements BuiltInStyle {
  const BaseStyle(this.type, this.theme);

  final ToastificationType type;
  final ThemeData theme;

  @override MaterialColor get primaryColor => ToastHelper.createMaterialColor(type.color);

  @override Color get foregroundColor => ToastHelper.createMaterialColor(Colors.white);

  @override IconData get icon => type.icon;

  @override IconData get closeIcon => Icons.close;

  @override Color get closeIconColor => foregroundColor.withValues(alpha: .4);

  @override BorderRadiusGeometry get borderRadius => const BorderRadius.all(Radius.circular(12));

  @override BorderSide get borderSide => const BorderSide(
    color: Colors.black12,
    width: 1,
  );

  @override EdgeInsetsGeometry get padding => const EdgeInsetsDirectional.fromSTEB(12, 16, 12, 16);
  @override EdgeInsetsGeometry get margin => const EdgeInsetsDirectional.fromSTEB(12, 16, 12, 16);

  @override double get progressIndicatorStrokeWidth => 2.0;

  @override TextStyle? get titleTextStyle => theme.textTheme.titleSmall?.copyWith(
    color: foregroundColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.25,
  );

  @override TextStyle? get descriptionTextStyle => theme.textTheme.titleSmall?.copyWith(
    color: foregroundColor.withValues(alpha: .8),
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.25,
  );

  @override double get elevation => 0.0;

  @override List<BoxShadow> get boxShadow => [];

  @override ProgressIndicatorThemeData get progressIndicatorTheme => ProgressIndicatorThemeData(
    color: foregroundColor.withValues(alpha: .15),
    linearMinHeight: progressIndicatorStrokeWidth,
    linearTrackColor: foregroundColor.withValues(alpha: .05),
    refreshBackgroundColor: foregroundColor.withValues(alpha: .05),
  );
}
