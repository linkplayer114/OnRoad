import 'package:client_shared/config.dart';

String serverUrl = "http://109.205.61.15:4000/";
String wsUrl = serverUrl.replaceFirst("http", "ws");

// Nominatim configuration (Only for Open Street Maps and MapBox)
List<String>? nominatimCountries; // ISO 3166-1alpha2 codes
String placesCountry = "en";
