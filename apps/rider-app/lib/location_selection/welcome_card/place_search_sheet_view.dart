import 'dart:async';

import 'package:client_shared/config.dart';
import 'package:client_shared/map_providers.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ridy/location_selection/welcome_card/place_confirm_sheet_view.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:collection/collection.dart';
import 'package:ridy/main/order.graphql.dart';
import 'package:ridy/schema.gql.dart';

import '../../config.dart';
import 'package:ridy/l10n/messages.dart';

class PlaceSearchSheetView extends StatefulWidget {
  final FullLocation? currentLocation;

  const PlaceSearchSheetView(this.currentLocation, {Key? key})
      : super(key: key);

  @override
  State<PlaceSearchSheetView> createState() => _PlaceSearchSheetViewState();
}

class _PlaceSearchSheetViewState extends State<PlaceSearchSheetView> {
  bool showChooseOnMap = true;
  Timer? _debounce;
  String? searchKeyword;
  List<FullLocation?> selectedLocations = [];

  int selectedIndex = 1;

  @override
  initState() {
    selectedIndex = widget.currentLocation == null ? 0 : 1;
    selectedLocations = [null, null];
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            splashRadius: 20,
          )
        ]),
        const SizedBox(height: 4),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomTheme.neutralColors.shade100),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                  children: selectedLocations.mapIndexed((index, e) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        index == 0
                            ? Ionicons.navigate
                            : (index == selectedLocations.length - 1
                                ? Ionicons.location
                                : Ionicons.flag),
                        color: index == selectedLocations.length - 1
                            ? CustomTheme.primaryColors
                            : CustomTheme.neutralColors,
                      ),
                    ),
                    if (index != selectedLocations.length - 1)
                      const DottedLine(
                        direction: Axis.vertical,
                        dashColor: CustomTheme.neutralColors,
                        lineLength: 20,
                        lineThickness: 2.0,
                      )
                  ],
                );
              }).toList()),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...selectedLocations.mapIndexed((index, location) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  autofocus: widget.currentLocation == null
                                      ? index == 0
                                      : index == 1,
                                  onTap: (() {
                                    setState(() {
                                      if (!showChooseOnMap) {
                                        showChooseOnMap = true;
                                      }
                                    });
                                    selectedIndex = index;
                                  }),
                                  onChanged: (value) async {
                                    if (value.isEmpty &&
                                        searchKeyword != null) {
                                      setState(() {
                                        searchKeyword = null;
                                      });
                                      return;
                                    }
                                    if (value.isNotEmpty) {
                                      if (_debounce?.isActive ?? false) {
                                        _debounce?.cancel();
                                      }
                                      _debounce = Timer(
                                          const Duration(milliseconds: 500),
                                          () async {
                                        var map = Hive.box('settings')
                                            .get('mapProvider');
                                        map ??= mapProvider ==
                                                MapProvider.googleMap
                                            ? 'googlemap'
                                            : (mapProvider == MapProvider.mapBox
                                                ? 'mapbox'
                                                : 'openstreet');
                                        setState(() {
                                          searchKeyword = value;
                                        });
                                      });
                                    }
                                  },
                                  decoration: noBorderInputDecoration.copyWith(
                                      hintText: index == 0
                                          ? S.of(context).current_location
                                          : (index <
                                                  selectedLocations.length - 1
                                              ? S.of(context).add_stop
                                              : S.of(context).your_destination),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: index ==
                                                      selectedLocations.length -
                                                          1
                                                  ? CustomTheme.primaryColors
                                                  : CustomTheme.neutralColors)),
                                ),
                              ),
                              if (index == selectedLocations.length - 1 &&
                                  selectedLocations.length < 5)
                                CupertinoButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedLocations = selectedLocations
                                          .followedBy([null]).toList();
                                    });
                                  },
                                  padding: const EdgeInsets.all(4),
                                  minSize: 0,
                                  child: const Icon(
                                    Icons.add,
                                    color: CustomTheme.neutralColors,
                                  ),
                                ),
                              if (index > 0 &&
                                  index < selectedLocations.length - 1)
                                CupertinoButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedLocations = [
                                        selectedLocations.first,
                                        ...selectedLocations.sublist(2)
                                      ];
                                    });
                                  },
                                  padding: const EdgeInsets.all(4),
                                  minSize: 0,
                                  child: const Icon(
                                    Icons.remove,
                                    color: CustomTheme.neutralColors,
                                  ),
                                )
                            ],
                          ),
                          if (index < selectedLocations.length - 1)
                            const Divider(),
                        ],
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 8,
          decoration:
              BoxDecoration(color: Colors.grey.shade50, boxShadow: const [
            BoxShadow(
                color: Color(0x0f000000),
                offset: Offset(0, 2),
                blurRadius: 12,
                spreadRadius: 0)
          ]),
        ),
        if (showChooseOnMap)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 1,
                  spreadRadius: -1,
                  offset: const Offset(0, -3)),
              const BoxShadow(
                  color: Color(0xfff2f5fa), blurRadius: 10, spreadRadius: 5),
            ]),
            child: Center(
              child: CupertinoButton(
                onPressed: () async {
                  final result = await showBarModalBottomSheet<FullLocation>(
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return PlaceConfirmSheetView(widget.currentLocation);
                      });
                  if (result == null) return;
                  setLocation(result);
                },
                minSize: 0,
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Ionicons.locate,
                      color: CustomTheme.neutralColors.shade600,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      S.of(context).action_choose_on_map,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: CustomTheme.neutralColors.shade600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        Container(
          height: 10,
          color: Colors.grey.shade50,
        ),
        if ((searchKeyword?.isEmpty ?? true) || searchKeyword!.length < 3)
          const SizedBox()
        else
          Query$getPlaces$Widget(
              options: Options$Query$getPlaces(
                variables: Variables$Query$getPlaces(
                    keyWord: searchKeyword!,
                    point: widget.currentLocation == null
                        ? null
                        : Input$PointInput(
                            lat: widget.currentLocation!.latlng.latitude,
                            lng: widget.currentLocation!.latlng.longitude),
                    language: placesCountry,
                    radius: 100000),
                onError: (error) {
                  print(error);
                },
              ),
              builder: (result, {refetch, fetchMore}) {
                if (result.parsedData == null) {
                  return const SizedBox();
                  // return Expanded(
                  //   child: ValueListenableBuilder(
                  //     valueListenable: Hive.box<List<LocationHistoryItem>>("history2")
                  //         .listenable(),
                  //     builder: (context, Box box, widget) => ListView.builder(
                  //         itemCount: (box.get("items",
                  //                     defaultValue:
                  //                         List<LocationHistoryItem>.from([]))
                  //                 as List<LocationHistoryItem>)
                  //             .length,
                  //         itemBuilder: (context, index) {
                  //           final historyItem = box.get("items",
                  //                   defaultValue:
                  //                       List<LocationHistoryItem>.from([]))[index]
                  //               as LocationHistoryItem;
                  //           return _recentSearch(
                  //               context,
                  //               FullLocation(
                  //                   latlng: historyItem.toLatLng(),
                  //                   address: historyItem.details,
                  //                   title: historyItem.name),
                  //               true,
                  //               (location) => setLocation(location));
                  //         }),
                  //   ),
                  // );
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: result.parsedData!.getPlaces.length,
                        itemBuilder: ((context, index) {
                          return LocationSearchResultItem(
                              location: result.parsedData!.getPlaces[index]
                                  .toFullLocation(),
                              isHistory: false,
                              onSelected: (location) => setLocation(location));
                        })),
                  );
                }
              }),
      ],
    );
  }

  void setLocation(FullLocation location) {
    selectedLocations[selectedIndex] = location;
    if (selectedLocations.sublist(1).indexWhere((element) => element == null) <
        0) {
      if (selectedLocations[0] == null && widget.currentLocation == null) {
        showPickupLocationCanNotBeEmptyDialog(context);
        return;
      }
      final List<FullLocation> locations = [
        selectedLocations[0] ?? widget.currentLocation!,
        ...(selectedLocations.sublist(1)).whereType<FullLocation>()
      ];

      Navigator.pop(context, locations);
      return;
    }
    setState(() {
      selectedLocations[selectedIndex] = location;
    });
  }

  void showPickupLocationCanNotBeEmptyDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).message_title_location),
            content: Text(S.of(context).message_body_location),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child:
                      Text(S.of(context).action_ok, textAlign: TextAlign.end))
            ],
          );
        });
  }
}

class LocationSearchResultItem extends StatelessWidget {
  final FullLocation location;
  final bool isHistory;
  final Function(FullLocation) onSelected;

  const LocationSearchResultItem(
      {required this.location,
      required this.isHistory,
      required this.onSelected,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        final result = await showBarModalBottomSheet<FullLocation>(
            context: context,
            enableDrag: false,
            builder: (context) {
              return PlaceConfirmSheetView(location);
            });
        if (result == null) return;
        onSelected(result);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  isHistory ? Ionicons.time : Ionicons.compass,
                  color: CustomTheme.neutralColors.shade400,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        location.address,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}

const noBorderInputDecoration = InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.all(8),
    filled: false,
    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none));

class FullLocation {
  String title;
  String address;
  LatLng latlng;

  FullLocation(
      {required this.latlng, required this.address, required this.title});
}

extension ConvertToFullLocation on Query$getPlaces$getPlaces {
  FullLocation toFullLocation() {
    return FullLocation(
        latlng: LatLng(point.lat, point.lng),
        address: address,
        title: title ?? '');
  }
}
