import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/config/navigation/app_navigation.dart';
import 'package:flutter_clean_architecture/injector.dart';
import 'config/theme/app_theme.dart';
import 'core/utils/constants.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return

      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        onGenerateRoute: AppNavigation().onGenerateRoutes,
        theme: AppTheme().light,
      );

    /*BlocProvider<RemoteUserLoginBloc>(
      create: (_) => injector()..add(const LoginUserEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        onGenerateRoute: AppNavigation().onGenerateRoutes,
        theme: AppTheme().light,
      ),
    );*/
  }
}
