import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:findhappytails/custtomscreen/textfild.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/colors.dart';
import 'package:findhappytails/utils/enstring.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custtomscreen/button.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  int _groupValue = 0;
  String? currentAddress = "Please Select Your Location";
  CameraPosition? _kGooglePlex;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  LatLng? lastLatLng;
  final Completer<GoogleMapController> _controller = Completer();
  //late ColorNotifier notifier;
  // getdarkmodepreviousstate() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   bool? previusstate = prefs.getBool("setIsDark");
  //   if (previusstate == null) {
  //     notifier.setIsDark = false;
  //   } else {
  //     notifier.setIsDark = previusstate;
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getdarkmodepreviousstate();
  }
  @override
  Widget build(BuildContext context) {
    //notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: height / 17),
          Row(
            children: [
              SizedBox(width: width / 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: height / 30,
                  color: const Color(0xffFC9340),
                ),
              ),
            ],
          ),
          SizedBox(height: height / 50),
          Row(
            children: [
              SizedBox(width: width / 20),
              Text(
                LanguageEn.newadress,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height / 30,
                  fontFamily: 'GilroyBold',
                ),
              )
            ],
          ),
          SizedBox(height: height / 200),
          Row(
            children: [
              SizedBox(width: width / 20),
              Text(
                LanguageEn.completeformbelow,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: height / 50,
                  fontFamily: 'GilroyMedium',
                ),
              )
            ],
          ),
          SizedBox(height: height / 35),
          Container(
            height: height / 3,
            width: width / 1.1,
            color: Colors.transparent,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex ??
                  const CameraPosition(target: LatLng(0.0, 0.0)),
              markers: Set<Marker>.of(markers.values),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onTap: (latLag) {
                getCurrentMap(latLag);
              },
            ),
          ),
          SizedBox(height: height / 30),
          adressbox(),
          SizedBox(height: height / 50),
      Expanded(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 1,
          itemBuilder: (context, index) {
          return Column(children: [
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.addressdetails,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 55,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 80),
            CustoomTextfild(LanguageEn.housenumberroom),
            SizedBox(height: height / 80),
            genderselect(),
            SizedBox(height: height / 20),
            Custombutton.button(
              LanguageEn.save,
              width / 1.1,
              Colors.transparent,
              const Color(0xffFC9340),
              Colors.white,
            ),
            SizedBox(height: height / 20),
          ],);
        },),
      )
        ],
      ),
    );
  }

  Widget genderselect() {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _groupValue = 0;
          },
        );
      },
      child: Container(
        height: height / 16,
        width: width / 1.1,
        decoration: const BoxDecoration(
          // border: Border.all(
          //     color: _groupValue == 0 ? buttoncolor : Colors.transparent,
          //     width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color(0xffecedfa),
        ),
        child: Row(
          children: [
            SizedBox(width: width / 20),
            Text(
              LanguageEn.setdefultaddress,
              style: TextStyle(
                  fontSize: height / 50,
                  fontFamily: 'GilroyMedium',
                  color: Colors.black),
            ),
            const Spacer(),
            Radio(
              activeColor:  const Color(0xffFC9340),
              value: 0,
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value as int;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget adressbox() {
    return Container(
      height: height / 11,
      width: width / 1.1,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        border: Border.all(
          color: const Color(0xffE0E0E0),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: width / 23),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height / 60),
              Container(
                color: Colors.transparent,
                width: width / 1.35,
                child: Text(
                  currentAddress ?? "",
                  style: TextStyle(
                    color: greay,
                    fontSize: height / 55,
                    fontFamily: 'GilroyMedium',
                  ),
                ),
              ),
              SizedBox(height: height / 150),
            ],
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios,
              color: const Color(0xffE0E0E0), size: height / 40),
          SizedBox(width: width / 20),
        ],
      ),
    );
  }

  Future<void> getCurrentData() async {
    Position position = await getLatLong();
    getCurrentMap(LatLng(position.latitude, position.longitude));
  }

  Future<void> getCurrentMap(LatLng latLng) async {
    _kGooglePlex = CameraPosition(target: latLng, zoom: 18);
    const MarkerId markerId = MarkerId("markerIdVal");
    final Marker marker = Marker(
      markerId: markerId,
      position: latLng,
      infoWindow: const InfoWindow(title: "", snippet: '*'),
      onTap: () {
        // _onMarkerTapped(markerId);
      },
    );
    markers.clear();
    markers[markerId] = marker;

    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 18.0)),
    );
    setState(() {});
    getAddressFromLatLong(latLng);
  }

  Future<Position> getLatLong() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(LatLng latLng) async {
    lastLatLng = latLng;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      String name = place.name.toString();
      String thoroughfare = place.thoroughfare.toString();
      String area = place.subLocality.toString();
      String city = place.locality.toString();
      String state = place.administrativeArea.toString();
      String country = place.country.toString();
      currentAddress = name +
          ((name.isNotEmpty) ? ", " : "") +
          thoroughfare +
          ((thoroughfare.isNotEmpty) ? ", " : "") +
          area +
          ((area.isNotEmpty) ? ", " : "") +
          city +
          ((city.isNotEmpty) ? ", " : "") +
          state +
          ((state.isNotEmpty) ? ", " : "") +
          country +
          ".";
      setState(() {});
    }
  }
}
