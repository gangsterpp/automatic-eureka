import 'package:test/test.dart';
import 'package:vox_ui_kit/utils/calculator.dart' as calculator;

void main() {
  test('calculateDistanceInKM Moscow - London', () {
    final distance = calculator.calculateDistanceInKM(lat1: 55.755787, lon1: 37.617634, lat2: 51.500153, lon2: -0.126236).toInt();
    expect(distance, 2500, reason: 'Distance should be 2500 kilometers');
  });

  test('calculateDistanceInM Moscow - London', () {
    final distance = calculator.calculateDistanceInM(lat1: 55.755787, lon1: 37.617634, lat2: 51.500153, lon2: -0.126236).toInt();
    expect(distance, 2500809, reason: 'Distance should be 2500809 meters');
  });
}
