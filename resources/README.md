

# Generate files

This can take a while some times, up to an hour.

```
dart resources/generate_geocodes.dart && dart format lib/src && dart fix --apply
```

# Parse geo codes

There is a geocode.txt file that is a concatenation of all files found in libphonenumber/resource/geocoding/en

to generate the concatenation, run this in the `libphonenumber/resource/geocoding/en`:

```
cat * > geocode.txt
```

Then copy paste the generated geocode.txt file inside the `resources/data_sources/` directory then run


```
dart resources/data_sources/convert_geo_codes.dart
```