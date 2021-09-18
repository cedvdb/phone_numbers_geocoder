# Phone geo coder

Used to find out where phone number originate from.

Warning: This library is not intended for a front end application as it uses a **HUGE** dataset. In other words it's big.

# Usage

```dart
  final areaCode = '1201200';
  final origin = 'Jersey City, NJ';
  final r1 = PhoneNumbersGeocoder.geocode('1201200999');
  expect(r1?.areaCode, equals('1201200'));
  expect(r1?.origin, equals('Jersey City, NJ'));
```