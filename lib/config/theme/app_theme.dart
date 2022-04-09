import 'package:flutter/material.dart';

class AppTheme {
   ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      secondaryHeaderColor: Colors.black,
      splashColor: Colors.transparent,
      fontFamily: 'IBM',
    );
  }

   ThemeData get dark {
     return ThemeData(
       appBarTheme: const AppBarTheme(
         elevation: 0,
         color: Colors.white,
       ),
       scaffoldBackgroundColor: Colors.white,
       primaryColor: Colors.black,
       secondaryHeaderColor: Colors.black,
       splashColor: Colors.transparent,
       fontFamily: 'IBM',
     );
   }
}
