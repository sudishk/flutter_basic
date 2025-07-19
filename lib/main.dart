

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// key=AIzaSyCVCilNQwMXK4Xp56Gvvekl2S6FrO0nIt0
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapSample(),
    );
  }
}
class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
   GoogleMapController? mapController;
   Set<Marker> _markers = {};


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 48.0),
        child: FloatingActionButton( onPressed: () async{
          try{
            Position position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high);
            List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

            Placemark place = placemarks[0];

            print(" Address: ${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}");
            print(position);

            LatLng currentLatLng = LatLng(position.latitude, position.longitude);

            setState(() {
              _markers.add(Marker(
                markerId: MarkerId("current_location"),
                position: currentLatLng,
                infoWindow: InfoWindow(
                    title: "You are here",
                    snippet: "${place.locality}, ${place.administrativeArea}"),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
              ));
            });

            mapController?.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: currentLatLng,
                  zoom: 17.0,
                ),
              ),
            );
          }catch(error){
            print("error $error");
          }

        },child: Icon(Icons.location_history),),
      ),
      body: GoogleMap(
            markers: _markers,

           onMapCreated: (controller) {
             mapController = controller;
             mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(77.34232, 77.5464,), zoom: 4)));
             setState(() {

             });
           },
          initialCameraPosition: CameraPosition(target: LatLng(83.3232, 63.34543)
          )
      ),
    );
  }


}
//
// const kGoogleApiKey = "AIzaSyCBSyyk0ug0asel3BLnp_FcksgVJA8bMZM";
// final GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
//
// class MapSearchPage extends StatefulWidget {
//   @override
//   _MapSearchPageState createState() => _MapSearchPageState();
// }
//
// class _MapSearchPageState extends State<MapSearchPage> {
//   GoogleMapController? mapController;
//   LatLng _center = LatLng(28.6139, 77.2090); // Default: Delhi
//   Marker? _searchedMarker;
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   Future<void> _handleSearch() async {
//     Prediction? p = await PlacesAutocomplete.show(
//       context: context,
//       apiKey: kGoogleApiKey,
//       mode: Mode.overlay,
//       language: "en",
//       components: [Component(Component.country, "in")],
//     );
//
//     if (p != null) {
//       PlacesDetailsResponse detail =
//       await _places.getDetailsByPlaceId(p.placeId!);
//       final lat = detail.result.geometry!.location.lat;
//       final lng = detail.result.geometry!.location.lng;
//
//       final searchedLocation = LatLng(lat, lng);
//
//       setState(() {
//         _center = searchedLocation;
//         _searchedMarker = Marker(
//           markerId: MarkerId('searched_place'),
//           position: searchedLocation,
//           infoWindow: InfoWindow(title: detail.result.name),
//         );
//       });
//
//       mapController?.animateCamera(CameraUpdate.newLatLngZoom(searchedLocation, 15));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Place Search Map"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: _handleSearch,
//           )
//         ],
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _center,
//           zoom: 11.0,
//         ),
//         markers: _searchedMarker != null ? {_searchedMarker!} : {},
//       ),
//     );
//   }
// }
