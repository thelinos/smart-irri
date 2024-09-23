import 'package:firebase_database/firebase_database.dart';

class AppRepository {
  AppRepository({required FirebaseDatabase database}) : _database = database;
  final FirebaseDatabase _database;

  Stream<double> get humidityStream {
    return _database.ref().child("humidity").onValue.map(
      (event) {
        return (event.snapshot.value as int).toDouble();
      },
    );
  }

  Stream<double> get soilMoistureStream {
    return _database.ref().child("soilMoisture").onValue.map(
      (event) {
        return (event.snapshot.value as int).toDouble();
      },
    );
  }

  Stream<double> get temperatureStream {
    return _database.ref().child("temperature").onValue.map<double>(
      (event) {
        return (event.snapshot.value as int).toDouble();
      },
    );
  }

  Stream<double> get waterLevelStream {
    return _database.ref().child("waterLevel").onValue.map(
      (event) {
        return (event.snapshot.value as int).toDouble();
      },
    );
  }
}
