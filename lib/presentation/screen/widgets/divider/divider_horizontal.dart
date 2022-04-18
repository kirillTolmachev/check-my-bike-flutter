import 'package:check_my_bike_flutter/presentation/screen/widgets/divider/base_divider.dart';
import 'package:flutter/cupertino.dart';

class DividerHorizontal extends BaseDivider {
  final int _width;

  const DividerHorizontal(thickness, this._width, {Color? color, Key? key})
      : super(thickness, color: color, key: key);

  @override
  int getHeightTemplateMethod() {
    return thickness;
  }

  @override
  int getWidthTemplateMethod() {
    return _width;
  }
}
