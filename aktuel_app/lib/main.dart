
import 'package:aktuel_app/helpers/custom_route.dart';
import 'package:aktuel_app/providers/aktuelDetails.dart';
import 'package:aktuel_app/providers/aktuels.dart';
import 'package:aktuel_app/providers/companies.dart';
import 'package:aktuel_app/screens/aktuelDetails_screen.dart';
import 'package:aktuel_app/screens/aktuels_screen.dart';
import 'package:aktuel_app/screens/companies_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Companies(),
        ),
        ChangeNotifierProvider.value(
          value: Aktuels(),
        ),
        ChangeNotifierProvider.value(
          value: AktuelDetails(),
        ),
      ],
      child: MaterialApp(
          title: 'Companies',
          theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.deepOrange,
            pageTransitionsTheme: PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CustomPageTransitionBuilder(),
                  TargetPlatform.iOS: CustomPageTransitionBuilder(),
                },
              ),
          ),
          home: CompaniesScreen(),
          routes: {
            AktuelsScreen.routeName: (ctx) => AktuelsScreen(),
            AktuelDetailsScreen.routeName:(ctx)=>AktuelDetailsScreen(),
          }),
    );
  }
}