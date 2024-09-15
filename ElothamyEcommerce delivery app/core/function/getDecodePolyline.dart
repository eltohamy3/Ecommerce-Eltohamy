import 'package:eltohamyecommercedeliveryapp/core/constant/key.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Set<Polyline> PolylineSet = {};

List<LatLng> polylineLg = [];

PolylinePoints polylinePoints = PolylinePoints();

 Future<void> getPolyLine(LatLng start, LatLng des) async {
  PolylinePoints polylinePoints = PolylinePoints();

  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    Google_API_KEY,
    PointLatLng(start.latitude, start.longitude),
    PointLatLng(des.latitude, des.longitude),
    travelMode: TravelMode.driving,
    wayPoints: [
      PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria"),
    ],
  );

  if (result.status == 'OK') {
    List<PointLatLng> polylineCoordinates = result.points;

    polylineCoordinates.forEach((PointLatLng point) {
      print('${point.latitude}, ${point.longitude}');
    });
  } else {
    print(result.errorMessage);
  }
}
