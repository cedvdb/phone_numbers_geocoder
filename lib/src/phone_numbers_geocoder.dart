import 'generated/geocodes.dart' as g;

class GeocodeResult {
  final String origin;
  final String areaCode;

  GeocodeResult({
    required this.origin,
    required this.areaCode,
  });
}

/// Utility to find out where a phone number originates from
class PhoneNumbersGeocoder {
  /// utility to find out where a phone number originate from
  ///
  /// it expects a [phoneNumber] starting with the country code
  /// example for france: 33499887766
  ///
  /// returns [GeocodeResult] when the origin could be found otherwise
  /// returns null
  static GeocodeResult? geocode(String phoneNumber) {
    if (phoneNumber.startsWith('+')) {
      phoneNumber = phoneNumber.substring(1);
    }
    for (int i = phoneNumber.length; i > 0; i--) {
      final areaCode = phoneNumber.substring(0, i);
      if (g.geoCodes.containsKey(areaCode)) {
        return GeocodeResult(
          origin: g.geoCodes[areaCode]!,
          areaCode: areaCode,
        );
      }
    }
  }
}
