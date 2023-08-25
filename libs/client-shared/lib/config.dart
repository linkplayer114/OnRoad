import 'package:client_shared/unit_of_measurement.dart';

import './map_providers.dart';
import 'package:latlong2/latlong.dart';

String serverIP = "x.x.x.x";

bool demoMode = false;
String companyName = "On Road";
String appName = "OnRoad";
MapProvider mapProvider = MapProvider.openStreetMap;
bool isGoogleMapsEnabled = true;
bool isMapBoxEnabled = true;
bool isOpenStreetMapEnabled = true;

// MapBox Configuration (Only if Map Provider is set to mapBox)
String mapBoxAccessToken = "";
String mapBoxUserId = "mapbox";
String mapBoxTileSetId = "streets-v12";

String loginTermsAndConditionsUrl = "";

String defaultCurrency = "PK";
String defaultCountryCode = "+92";
const List<double> tipPresets = [10, 20, 50];

LatLng fallbackLocation = LatLng(37.3382, -121.8863);

// Menu website url
String? websiteUrl;

UnitOfMeasurement unitOfMeasurement = UnitOfMeasurement.metric;
