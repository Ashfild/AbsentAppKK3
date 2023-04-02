import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AbsentAppFirebaseUser {
  AbsentAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

AbsentAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AbsentAppFirebaseUser> absentAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AbsentAppFirebaseUser>(
      (user) {
        currentUser = AbsentAppFirebaseUser(user);
        return currentUser!;
      },
    );
