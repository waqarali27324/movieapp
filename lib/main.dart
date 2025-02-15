import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sample_app/routes/route_helper.dart';
import 'package:sample_app/utils/theme/colors.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
  // runApp(const MyApp());
  // runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: AppColors.whiteColor,
      ),
      // home: const NavBar(),
      getPages: RouteHelper.routes,
      initialRoute: RouteHelper.initialRoute,

    );
  }
}
