import 'dart:math';

const p = 0.017453292519943295;

final c = cos;

/// Calculate the distance between two coordinates in kilometers
///
/// [lat1] is the latitude of the first coordinate
///
/// [lon1] is the longitude of the first coordinate
///
/// [lat2] is the latitude of the second coordinate
///
/// [lon2] is the longitude of the second coordinate
///
/// Returns the distance in kilometers
double calculateDistanceInKM({required double lat1, required double lon1, required double lat2, required double lon2}) {
  final a = 0.5 - c((lat2 - lat1) * p) / 2 + c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

/// Calculate the distance between two coordinates in meters
///
/// [lat1] is the latitude of the first coordinate
///
/// [lon1] is the longitude of the first coordinate
///
/// [lat2] is the latitude of the second coordinate
///
/// [lon2] is the longitude of the second coordinate
///
/// Returns the distance in meters
double calculateDistanceInM({required double lat1, required double lon1, required double lat2, required double lon2}) {
  final a = 0.5 - c((lat2 - lat1) * p) / 2 + c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742000 * asin(sqrt(a));
}
