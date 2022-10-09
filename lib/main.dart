import 'package:flutter/material.dart';

import 'app_route.dart';

void main() {
  runApp(MyApp(appRouter: AppRoute(),));
}

class MyApp extends StatelessWidget {

   final AppRoute appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
