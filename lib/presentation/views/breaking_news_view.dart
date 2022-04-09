import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/blocs/remote_articles/remote_user_login_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../domain/entities/article.dart';


class BreakingNewsView extends StatelessWidget {
  const BreakingNewsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Daily News', style: TextStyle(color: Colors.black)),
      actions: [
        Builder(
          builder: (context) => GestureDetector(
            onTap: () => _onShowSavedArticlesViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Ionicons.bookmark, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {

    return BlocBuilder<RemoteUserLoginBloc, UserState>(
      builder: (_, state) {
        if (state is UserStateLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is UserLoginError) {
          return const Center(child: Icon(Ionicons.refresh));
        }
        if (state is UserLoginDone) {
          return Container();
        }
        return const SizedBox();
      },
    );
  }


  void _onArticlePressed(BuildContext context, Article article) {
    Navigator.pushNamed(context, '/ArticleDetailsView', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticlesView');
  }
}
