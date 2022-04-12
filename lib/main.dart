import 'package:check_my_bike_flutter/presentation/navigation/navigation_service.dart';
import 'package:check_my_bike_flutter/presentation/navigation/router.dart' as router;
import 'package:check_my_bike_flutter/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const App());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ColorRes.startGradient));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return MultiProvider(
      providers: [
        Provider<SplashBloc>.value(value: SplashBloc()),
        Provider<MainBloc>.value(value: MainBloc()),
        Provider<InfoBloc>.value(value: InfoBloc()),
        Provider<StoryBloc>.value(value: StoryBloc()),
        Provider<SettingsBloc>.value(value: SettingsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SNL',
        navigatorKey: NavigationService().navigatorKey,
        onGenerateRoute: router.generateRoute,
        initialRoute: router.SplashScreenRoute,
      ),
    );*/

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Check My Bike',
      navigatorKey: NavigationService().navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: router.MainScreenRoute,
    );
  }
}
