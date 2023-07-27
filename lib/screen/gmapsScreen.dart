import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class GMapScreen extends StatefulWidget {
  @override
  State<GMapScreen> createState() => _GMapScreenState();
}

class _GMapScreenState extends State<GMapScreen> {
  late GoogleMapController? mapController;
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLocationPermission();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: _locationData != null ? GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(_locationData!.latitude!, _locationData!.longitude!),
          zoom: 14.0
        ),
        markers: {
          Marker(
            markerId: MarkerId("Marker_1"),
            position: LatLng(_locationData!.latitude!, _locationData!.longitude!),
          )
        },
      ) : Center(child: CircularProgressIndicator(),),
    );
  }

  Future<void> checkLocationPermission() async{
    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled = await location.requestService();
      if(!_serviceEnabled){
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await location.requestPermission();
      if(_permissionGranted != PermissionStatus.granted){
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {

    });
  }
}
