import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/characters_provider.dart';
import 'providers/episodes_provider.dart';
import 'providers/locations_provider.dart';
import 'screens/home_screen.dart';

void mainDelegate() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CharacterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EpisodesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationsProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          accentColor: Color(0xffFF9800),
          primaryColorDark: Color(0xffFFFFFF),
          primaryColor: Color(0xff202329),
          backgroundColor: Color(0xff202329),
          cardColor: Color(0xff3C3E44),
          appBarTheme: AppBarTheme(
            color: Color(0xff202329),
            textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 18,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          bottomAppBarColor: Color(0xff202329),
          textTheme: TextTheme(
            headline1: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xffFFFFFF),
              fontSize: 25,
            ),
            headline2: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff202329),
              fontSize: 16,
            ),
            headline3: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff202329),
              fontSize: 16,
            ),
            subtitle1: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xffFF9800),
              fontSize: 14,
            ),
            bodyText1: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 14,
            ),
            bodyText2: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 12,
            ),
            caption: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xffFFFFFF),
              fontSize: 12,
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
