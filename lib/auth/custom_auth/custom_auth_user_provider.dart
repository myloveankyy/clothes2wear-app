import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class Clothes2WearProductionAuthUser {
  Clothes2WearProductionAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<Clothes2WearProductionAuthUser>
    clothes2WearProductionAuthUserSubject =
    BehaviorSubject.seeded(Clothes2WearProductionAuthUser(loggedIn: false));
Stream<Clothes2WearProductionAuthUser> clothes2WearProductionAuthUserStream() =>
    clothes2WearProductionAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
