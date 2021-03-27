import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:my_app/models/cards.dart';
import 'package:my_app/repositories/repositories.dart';

import 'auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepositories userRepositories;

  AuthenticationBloc(this.userRepositories)
      : assert(userRepositories != null),
        super(AuthenticationUnauthenticated());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepositories.hasToken();
      if (hasToken) {
        final List<Card> _loadedCardsList =
            await userRepositories.getAllCards();
        yield AuthenticationAuthenticated(loadedCards: _loadedCardsList);
      } else {
        yield AuthenticationUnauthenticated();
      }
    }
    if (event is LoggedIn) {
      yield AuthenticationLoading();
      try {
        try {
          final token =
              await userRepositories.login(event.username, event.password);
          await userRepositories.writeToken(token);
        } catch (e1) {
          yield AuthenticationUnauthenticated();
        }
        final List<Card> _loadedCardsList =
            await userRepositories.getAllCards();
        yield AuthenticationAuthenticated(loadedCards: _loadedCardsList);
      } catch (e) {
        yield AuthenticationFailure();
      }
    }
    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepositories.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
