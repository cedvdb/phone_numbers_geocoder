import 'package:phone_numbers_geocoder/src/phone_numbers_geocoder.dart';
import 'package:test/test.dart';

void main() {
  group('Geocoder', () {
    test('Should find the origin', () {
      final areaCode = '1201200';
      final origin = 'Jersey City, NJ';
      // we don't care if the phone number is valid, just that it starts with
      // something that can be geocoded
      final r1 = PhoneNumbersGeocoder.geocode(areaCode + '999');
      final r2 = PhoneNumbersGeocoder.geocode('+' + areaCode + '999');
      expect(r1?.areaCode, equals(areaCode));
      expect(r1?.origin, equals(origin));
      expect(r2?.areaCode, equals(areaCode));
      expect(r2?.origin, equals(origin));
    });

    test('Should return null when not found', () {
      final r1 = PhoneNumbersGeocoder.geocode('');
      final r2 = PhoneNumbersGeocoder.geocode('0');
      final r3 = PhoneNumbersGeocoder.geocode('728399');
      expect(r1, equals(null));
      expect(r2, equals(null));
      expect(r3, equals(null));
    });
  });
}
