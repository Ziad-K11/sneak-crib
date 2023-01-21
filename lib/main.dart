import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sneak_crib/core/utils/const.dart';
import 'package:sneak_crib/core/utils/shared_prefrences.dart';
import 'package:sneak_crib/home/pages/home_screen.dart';

import 'login//pages/Login.dart';

//app entry
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');

  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: uId == null ? LoginPage() : const NikeShoesHome(),
    ),
  );
}
