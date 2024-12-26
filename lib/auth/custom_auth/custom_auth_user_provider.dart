import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class Clothes2WearNCBAuthUser {
  Clothes2WearNCBAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<Clothes2WearNCBAuthUser> clothes2WearNCBAuthUserSubject =
    BehaviorSubject.seeded(Clothes2WearNCBAuthUser(loggedIn: false));
Stream<Clothes2WearNCBAuthUser> clothes2WearNCBAuthUserStream() =>
    clothes2WearNCBAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
