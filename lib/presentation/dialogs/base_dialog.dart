import 'package:flutter/material.dart';

import '../../resources/color_res.dart';

abstract class BaseDialog {
  List<Widget> getWidgetsTemplateMethod(BuildContext context);

  void show(BuildContext context, String title, {bool autoDismiss = false}) {
    List<Widget> widgets = getWidgetsTemplateMethod(context);

    Widget dialog = _build(widgets, title);

    showDialog(
        barrierDismissible: autoDismiss,
        context: context,
        builder: (_) {
          return dialog;
        });
  }

  Widget _build(List<Widget> widgets, String title) {
    return AlertDialog(
      title: _buildTitle(title),
      titlePadding: const EdgeInsets.only(top: 30),
      shape: _buildShapeBorder(),
      backgroundColor: ColorRes.endGradient,
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(top: 20, bottom: 30),
      actions: widgets,
    );
  }

  Widget _buildTitle(String title) {
    return Text(title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Roboto Thin',
            color: ColorRes.green,
            fontSize: 20,
            fontWeight: FontWeight.bold));
  }

  ShapeBorder _buildShapeBorder() {
    return RoundedRectangleBorder(
        side: BorderSide(width: 0.3, color: ColorRes.green),
        borderRadius: const BorderRadius.all(Radius.circular(10)));
  }
}
