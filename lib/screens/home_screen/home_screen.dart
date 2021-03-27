import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/auth.dart';
import 'package:my_app/generated/l10n.dart';
import 'package:my_app/screens/home_screen/widgets/tab_bar_list.dart';
import 'package:my_app/style/theme.dart';

class HomeScreen extends StatefulWidget {
  final List<dynamic> listCards;

  HomeScreen({@required this.listCards});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Themes.mainBC,
        appBar: AppBar(
          backgroundColor: Themes.appBarBC,
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
              splashColor: Themes.tealC,
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Themes.textC,
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Themes.tealC,
            labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: S.of(context).on_hold),
              Tab(text: S.of(context).in_progress),
              Tab(text: S.of(context).needs_review),
              Tab(text: S.of(context).approved),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabListView(
              listCardsWithRow: widget.listCards,
              row: "0",
            ),
            TabListView(
              listCardsWithRow: widget.listCards,
              row: "1",
            ),
            TabListView(
              listCardsWithRow: widget.listCards,
              row: "2",
            ),
            TabListView(
              listCardsWithRow: widget.listCards,
              row: "3",
            ),
          ],
        ),
      ),
    );
  }
}
