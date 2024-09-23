import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_irri_app/app_bloc_observer.dart';
import 'package:smart_irri_app/bloc/data_bloc.dart';
import 'package:smart_irri_app/firebase_options.dart';
import 'package:smart_irri_app/pages/home_page.dart';
import 'package:smart_irri_app/repositories/app_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Bloc.observer = const AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AppRepository(database: FirebaseDatabase.instance),
      lazy: false,
      child: BlocProvider(
        create: (context) => DataBloc(
          repository: context.read<AppRepository>(),
        )
          ..add(const DataEvent.onHumidityChanged())
          ..add(const DataEvent.onSoilMoistureChanged())
          ..add(const DataEvent.onTemperatureChanged())
          ..add(const DataEvent.onWaterLevelChanged()),
        lazy: false,
        child: MaterialApp(
          title: 'Smart Irris',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade400),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
