import 'dart:developer';
import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart' as latLng2;
import 'package:url_launcher/url_launcher.dart';

class DangerZones extends StatefulWidget {
  const DangerZones({super.key});

  @override
  State<DangerZones> createState() => _DangerZonesState();
}

class _DangerZonesState extends State<DangerZones> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final MapController flutterMapController = MapController();

  final List<Map<String, dynamic>> dangerZones = [
    {
      'name': 'Arish International Road',
      'location': latLng2.LatLng(31.1325, 33.7985),
      'accidents': 25,
    },
    {
      'name': 'Suez – Ismailia Road',
      'location': latLng2.LatLng(30.5852, 32.2654),
      'accidents': 18,
    },
    {
      'name': 'Arish International Road',
      'location': latLng2.LatLng(31.1325, 33.7985),
      'accidents': 25,
    },
    {
      'name': 'Suez – Ismailia Road',
      'location': latLng2.LatLng(30.5852, 32.2654),
      'accidents': 18,
    },
    {
      'name': 'Arish International Road',
      'location': latLng2.LatLng(31.1325, 33.7985),
      'accidents': 25,
    },
    {
      'name': 'Suez – Ismailia Road',
      'location': latLng2.LatLng(30.5852, 32.2654),
      'accidents': 18,
    },
    {
      'name': 'Arish International Road',
      'location': latLng2.LatLng(31.1325, 33.7985),
      'accidents': 25,
    },
    {
      'name': 'Suez – Ismailia Road',
      'location': latLng2.LatLng(30.5852, 32.2654),
      'accidents': 18,
    },
    {
      'name': 'Nuweiba – Taba Road',
      'location': latLng2.LatLng(29.5, 34.5),
      'accidents': 12,
    },
  ];
  List<bool> copiedList = [];

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    // ممكن تضيف SnackBar أو Toast هنا
    print("تم نسخ الرابط: $text");
  }

  @override
  void initState() {
    super.initState();
    copiedList = List<bool>.filled(dangerZones.length, false);
  }

  List<Marker> _buildMarkers() {
  return dangerZones.map((zone) {
    return Marker(
      width: 40.0,
      height: 40.0,
      point: zone['location'],
      child:  InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: Text(zone['name']),
              content: Text(
                'Accidents: ${zone['accidents']}',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Close'),
                ),
              ],
            ),
          );
        },
        child: Icon(
          Icons.location_on,
          color: Colors.red,
          size: 30,
        ),
      ),
    );
  }).toList();
}

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1201;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 0.7),
      key: scaffoldKey,
      appBar: isMobile
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: const HeaderDesktop(title: ''),
              leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: SvgPicture.asset(
                  Assets.imagesAuthImagesMenu,
                  height: 25,
                ),
              ),
            )
          : null,
      drawer: isMobile
          ? CustomDrawer(
              activeIndex: 1,
              onTap: (index) {},
            )
          : null,
      body: isMobile
          ? Stack(
              children: [
                FlutterMap(
                  mapController: flutterMapController,
                  options: MapOptions(
                    initialCenter: dangerZones[0]['location'],
                    initialZoom: 16.0,
                    maxZoom: 16.0,
                    minZoom: 16.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: _buildMarkers(),
                    ),
                  ],
                ),
                // قائمة الأماكن في أسفل الشاشة
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, -2),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Danger Zones',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: dangerZones.length,
                            itemBuilder: (context, index) {
                              final zone = dangerZones[index];
                              return ListTile(
                                leading: Icon(Icons.warning, color: Colors.red),
                                title: Text(zone['name']),
                                subtitle:
                                    Text('Accidents: ${zone['accidents']}'),
                                onTap: () {
                                  
                                                final location =
                                                    zone['location'] as latLng2.LatLng;
                                                flutterMapController.move(
                                                    location, 18);
                                },
                                trailing: IconButton(
                                  icon: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 300),
                                    child: copiedList[index]
                                        ? Icon(Icons.check,
                                            key: ValueKey('check$index'),
                                            size: 18,
                                            color: Colors.green)
                                        : Icon(Icons.copy,
                                            key: ValueKey('copy$index'),
                                            size: 18,
                                            color: Colors.black),
                                  ),
                                  onPressed: () {
                                    final String locationUrl =
                                        'https://www.google.com/maps?q=${zone['location'].latitude},${zone['location'].longitude}';

                                    copyToClipboard(locationUrl);

                                    setState(() {
                                      copiedList[index] = true;
                                    });

                                    Future.delayed(Duration(seconds: 2), () {
                                      setState(() {
                                        copiedList[index] = false;
                                      });
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomDrawer(
                    activeIndex: 1,
                    onTap: (index) {
                      log(index.toString());
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Scaffold(
                    backgroundColor: const Color.fromRGBO(217, 217, 217, 0.7),
                    appBar: const PreferredSize(
                      preferredSize: Size.fromHeight(60),
                      child: HeaderDesktop(title: 'Danger Zones'),
                    ),
                    body: Stack(
                      children: [
                        // خريطة جوجل
                        FlutterMap(
                          mapController: flutterMapController,
                          options: MapOptions(
                            initialCenter: dangerZones[0]
                                ['location'], // لازم تكون LatLng من latlong2
                            initialZoom: 14.0, // زي minMaxZoomPreference
                            maxZoom: 14.0,
                            minZoom: 14.0,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                              subdomains: ['a', 'b', 'c'],
                            ),
                            MarkerLayer(
                              markers: _buildMarkers(),
                            ),
                          ],
                        ),
                        // الكارد اللي فوق الخريطة
                        Positioned(
                          top: 10,
                          right: 10,
                          bottom: 10,
                          child: GestureDetector(
                            onVerticalDragDown:
                                (_) {}, // تمنع السحب عموديًا وبالتالي تمنع التفاعل مع الخريطة
                            child: Container(
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 10.0, left: 10),
                                    child: Text(
                                      'Danger Zones',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Locations',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFFADACAC),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, bottom: 10, right: 10),
                                      child: ListView.builder(
                                        itemCount: dangerZones.length,
                                        itemBuilder: (context, index) {
                                          final zone = dangerZones[index];
                                          return Card(
                                            elevation: 2,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: ListTile(
                                              leading: const Icon(Icons.warning,
                                                  color: Colors.red),
                                              title: Text(zone['name']),
                                              subtitle: Text(
                                                  'Accidents: ${zone['accidents']}'),
                                              onTap: () {
                                                final location =
                                                    zone['location'] as latLng2.LatLng;
                                                flutterMapController.move(
                                                    location, 18);
                                              },
                                              trailing: IconButton(
                                                icon: AnimatedSwitcher(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  child: copiedList[index]
                                                      ? Icon(Icons.check,
                                                          key:
                                                              ValueKey('check'),
                                                          size: 18,
                                                          color: Colors.green)
                                                      : Icon(Icons.copy,
                                                          key: ValueKey('copy'),
                                                          size: 18,
                                                          color: Colors.black),
                                                ),
                                                onPressed: () {
                                                  final String locationUrl =
                                                      'https://www.google.com/maps?q=${zone['location'].latitude},${zone['location'].longitude}';

                                                  copyToClipboard(locationUrl);

                                                  setState(() {
                                                    copiedList[index] = true;
                                                  });

                                                  // نرجع الأيقونة الأصلية بعد 2 ثانية
                                                  Future.delayed(
                                                      const Duration(
                                                          seconds: 2), () {
                                                    setState(() {
                                                      copiedList[index] = false;
                                                    });
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
