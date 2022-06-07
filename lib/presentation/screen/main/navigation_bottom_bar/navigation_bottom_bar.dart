import 'package:check_my_bike_flutter/domain/bloc/navigation/event/show_screen_event.dart';
import 'package:check_my_bike_flutter/domain/bloc/navigation/state/scroll_screen_state.dart';
import 'package:check_my_bike_flutter/domain/bloc/navigation/state/show_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:isolate_bloc/isolate_bloc.dart';

import '../../../../domain/bloc/navigation/navigation_bloc.dart';
import '../../../../domain/bloc/navigation/state/navigation_state.dart';
import '../../../../resources/colors_res.dart';
import '../../../widgets/rotated_icon.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> barItems = _buildBottomNavigationBarItems();
    int _index = 0;
    return IsolateBlocBuilder<NavigationBloc, NavigationState>(builder: (context, state) {
      _index = state is ShowScreenState ? MainScreenType.values.indexOf(state.screen) : _index;
      Color color = _index == 1 ? ColorsRes.endGradient : Colors.transparent;
      return Theme(
          data: _buildTheme(context),
          child: AnimatedScale(
              alignment: Alignment.bottomCenter,
              duration: const Duration(milliseconds: 500),
              scale: _getScale(state),
              child: Stack(children: [
                _buildNavigationBarLine(context, _index),
                _buildBottomNavigationBar(_index, context, barItems, color)
              ])));
    });
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return [
      _buildBarItem(Icons.search, 'Check'),
      _buildBarItem(Icons.summarize, 'Manufacturers'),
      _buildBarItem(Icons.settings_outlined, 'Settings')
    ];
  }

  BottomNavigationBarItem _buildBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: _buildRotatedIcon(icon), label: label, tooltip: "");
  }

  RotatedIcon _buildRotatedIcon(IconData icon) {
    return RotatedIcon(icon, key: GlobalKey<RotatedIconState>());
  }

  ThemeData _buildTheme(BuildContext context) {
    Color color = Colors.transparent;
    return Theme.of(context).copyWith(splashColor: color, highlightColor: color, hoverColor: color);
  }

  double _getScale(NavigationState state) {
    double visible = 1;
    double invisible = 0;
    if (state is ScrollScreenState && state.direction == ScrollDirectionType.bottom) {
      return invisible;
    }
    return visible;
  }

  Widget _buildNavigationBarLine(BuildContext context, index) {
    return SizedBox(
        height: 1,
        child: Align(
            alignment: _buildLineAlignment(index),
            child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                width: MediaQuery.of(context).size.width / 3.7,
                color: ColorsRes.green)));
  }

  Alignment _buildLineAlignment(int index) {
    const center = 0;
    const right = 2;

    if (index == center) {
      return Alignment.centerLeft;
    } else if (index == right) {
      return Alignment.centerRight;
    }
    return Alignment.center;
  }

  Widget _buildBottomNavigationBar(
      int index, BuildContext context, List<BottomNavigationBarItem> barItems, Color color) {
    return BottomNavigationBar(
        currentIndex: index,
        elevation: 0,
        backgroundColor: color,
        selectedItemColor: ColorsRes.green,
        selectedIconTheme: IconThemeData(color: ColorsRes.green, size: 30),
        selectedLabelStyle: _buildTextStyle(),
        unselectedItemColor: Colors.white,
        unselectedIconTheme: const IconThemeData(color: Colors.white, size: 30),
        unselectedLabelStyle: _buildTextStyle(),
        items: barItems,
        onTap: (index) {
          _rotateIcon(barItems[index].icon as RotatedIcon);
          _showScreenWithDelay(MainScreenType.values[index], context);
        });
  }

  TextStyle _buildTextStyle() {
    return const TextStyle(fontFamily: 'Roboto Thin', fontSize: 14);
  }

  void _rotateIcon(RotatedIcon icon) {
    (icon.key as GlobalKey<RotatedIconState>).currentState?.rotate();
  }

  void _showScreenWithDelay(MainScreenType screen, BuildContext context) {
    Future.delayed(const Duration(milliseconds: 520), () {
      context.isolateBloc<NavigationBloc, NavigationState>().add(ShowScreenEvent(screen));
    });
  }
}
