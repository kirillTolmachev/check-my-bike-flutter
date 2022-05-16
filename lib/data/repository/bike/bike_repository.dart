import 'package:check_my_bike_flutter/domain/entity/bike_entity.dart';
import 'package:check_my_bike_flutter/domain/entity/location_entity.dart';

abstract class BikeRepository {
  Future<List<BikeEntity>> loadFromRestBySerial(String serial, int page);

  Future<List<BikeEntity>> loadFromRestByLocation(LocationEntity location, int distance, int page);

  Future<List<BikeEntity>> loadFromRestByManufacturer(String manufacturer, int page);

  Future<List<BikeEntity>> loadFromRestByCustomParameter(String customParameter, int page);

  Future<void> saveToDatabase(List<BikeEntity> bikes);

  Future<List<BikeEntity>> loadFromDatabase();

  Future<void> clearInDatabase();
}
