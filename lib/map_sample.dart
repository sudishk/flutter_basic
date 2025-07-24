import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/map_api_services.dart';
import 'package:flutter_basic/place_api_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  GoogleMapController? mapController;
  Set<Marker> _markers = {};
  PlaceApiModel? placeApiModel;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
         title: SearchBar(hintText: "Search place" ,onChanged: (value) async{
         if(value.isNotEmpty && value.length>3){
           var res =await MapApiServices.searchLocation("$value");
           print(res?.places?[0].formattedAddress);
           if(res!=null){
             placeApiModel = res;
             setState(() {

             });
           }
         }

       },),
       ) ,

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
      body: ListView(
        children: [
          SizedBox(height: 500, child: placeApiModel ==null? Text("No Address found")
              : ListView.builder(
            itemCount: placeApiModel?.places?.length,
            itemBuilder: (context, index) {
              var place = placeApiModel?.places?[index].formattedAddress;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$place", style: TextStyle(color: Colors.black),),
              );
            },),),
          GoogleMap(
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
        ],
      ),
    );
  }


}

