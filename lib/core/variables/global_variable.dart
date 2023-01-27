import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final User? docUser = FirebaseAuth.instance.currentUser;