import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_app/generated/l10n.dart';
import 'package:my_app/repositories/repositories.dart';
import 'package:my_app/screens/home_screen/home_screen.dart';
import 'package:my_app/screens/login_screen/login_screen.dart';

import 'bloc/auth.dart';

void main() {
  final UserRepositories userRepositories = UserRepositories();
  runApp(BlocProvider(
    create: (context) {
      return AuthenticationBloc(userRepositories)..add(AppStarted());
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: S.of(context).title,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return HomeScreen(listCards: state.loadedCards);
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginScreen();
          }
          if (state is AuthenticationFailure) {
            return LoginScreen();
          }
          if (state is AuthenticationLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
