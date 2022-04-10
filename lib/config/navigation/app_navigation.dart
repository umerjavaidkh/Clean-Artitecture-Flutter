import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injector.dart';
import '../../presentation/blocs/user_login/remote_user_login_bloc.dart';
import '../../presentation/blocs/user_register/remote_user_register_bloc.dart';
import '../../presentation/views/dash_board_screen.dart';
import '../../presentation/views/login_screen.dart';
import '../../presentation/views/signUp_screen.dart';



class AppNavigation {
   Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(
           BlocProvider<RemoteUserLoginBloc>(
            create: (_) => injector(),
            child: ScreenLogin(),
            ));
        break;

      case '/signup':

        return _materialRoute(
            BlocProvider<RemoteUserRegisterBloc>(
              create: (_) => injector(),
              child: ScreenSignup(),
            ));
        break;

      case '/dashboard':
        return _materialRoute(DashboardScreen(user: settings.arguments,));
        break;
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
