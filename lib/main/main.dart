import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../ui/components/components.dart';
import '../ui/themes/themes.dart';
import './factories/pages/pages.dart';

void inicialization() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    return GetMaterialApp(
      builder: (_, widget) {
        return Stack(
          children: [
            widget!,
            const Align(
              alignment: Alignment.bottomCenter,
              child: CustomAlertConnection(),
            )
          ],
        );
      },
      title: 'InfatecVaucher',
      debugShowCheckedModeBanner: false,
      theme: makeAppThemeLight(),
      initialRoute: '/login',
      navigatorObservers: [routeObserver],
      getPages: [
        GetPage(name: '/login', page: makeLoginPage),
      ],
    );
  }
}
