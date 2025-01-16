import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:task/models/site_model.dart';

class SitesMap extends StatefulWidget {
  const SitesMap({
    super.key,
    required this.sites,
  });

  final List<SiteModel> sites;

  @override
  State<SitesMap> createState() => _SitesMapState();
}

class _SitesMapState extends State<SitesMap> {
  final mapController = MapController();

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCameraFit: CameraFit.coordinates(
          coordinates:
              widget.sites.map((e) => LatLng(e.latitude, e.longitude)).toList(),
          padding: EdgeInsets.all(48),
        ),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        MarkerLayer(
          markers: widget.sites
              .map(
                (e) => Marker(
                  point: LatLng(e.latitude, e.longitude),
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.siteName),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.location_on,
                        color: e.isOpen ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
