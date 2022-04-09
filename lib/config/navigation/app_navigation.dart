import 'package:flutter/material.dart';

import '../../presentation/views/login_screen.dart';



class AppNavigation {
   Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute( ScreenLogin());
        break;

      /*case '/ArticleDetailsView':
        return _materialRoute(ArticleDetailsView(article: settings.arguments as Article));
        break;

      case '/SavedArticlesView':
        return _materialRoute(const SavedArticlesView());
        break;*/
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
