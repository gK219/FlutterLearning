import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/carts_page.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/screens/login_page.dart';
import 'package:my_flutter_app/screens/home_page.dart';
import 'package:my_flutter_app/utils/routes.dart';
import 'package:my_flutter_app/widgets/themes.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    num temp = 30.5; // can take float and int both
    var day = "Saturday"; // decide the type of datatype by the value
    const pi = 3.14;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/"      : (context) => LoginPage(),
        MyRoutes.homeRoute : (context) => HomePage(),
        MyRoutes.loginRoute : (context) => LoginPage(),
        MyRoutes.cartRoute : (context) => CartPage()
      },
    );
  }
}
