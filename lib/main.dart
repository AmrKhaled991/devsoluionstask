import 'package:devsoluionstask/core/utils/helpers/getItLocator.dart';
import 'package:devsoluionstask/features/favorites/data/models/hiveProduct/hive_prodcut.dart';
import 'package:devsoluionstask/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
   Hive.registerAdapter(HiveProductAdapter());

    Hive.registerAdapter(RatingAdapter());
  await Hive.openBox<HiveProduct>('favoriteProduct');
 

  setupGitItLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ProviderScope(child: HomeScreen()),
    );
  }
}
