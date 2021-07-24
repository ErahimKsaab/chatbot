import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class chatpot extends StatefulWidget {
  @override
  _chatpotState createState() => _chatpotState();
}

class _chatpotState extends State<chatpot> {
List latitude=[
  30.048768324494056,
  30.042836943079685,
  30.044593697493386,
  30.04523820415656,
  30.050398437756467,
  30.051072086670604,
  30.05166999596955,
  30.051484644486663,
  30.05258678327984,
  30.050926595022457,
  30.049190866773863,
  30.018612191177464,
  30.0104535861918,
  30.01556959965776,
  30.007115557079658,
  29.995816728077678,
  29.994319087470316,
  30.00224384576316,
  29.980035037067154,
  29.995899898551365,
  29.997776936241767,
  29.999688535875887,
  30.004277834740858,
  30.011028069445892,
  30.015581616721967,
  30.06583629892485,
  30.073799366222904,
  30.100403973234418,
  30.006054851464754,
  30.03872393213389,
  30.038025754172455,
  30.036415819020757,
  30.033717152082044,
  30.037602867520842,
  30.04186664574462,
  30.041935321955496,
  30.042492206996045,
  30.054992191761045,
];
List longtude=[
  31.19452748140142,
 31.194604184395477,
   31.194594321399205,
31.191933854735375,
 31.19359884267022,
 31.193479110165224,
   31.194436969662306,
  31.19586915362255,
   31.1969720736746,
 31.20110744763053,
   31.20715123984189,
   31.199095780062194,
 31.192566307418165,
   31.209102169781673,
  31.193406909689987,
  31.202365796998123,
  31.195448834963717,
   31.1758267600601,
  31.191248954684234,
  31.204147586572873,
   31.197351551116864,
 31.18797066833499,
   31.199516909600472,
  31.21216519497176,
 31.216766547939116,
 31.207631584800072,
 31.215406351724575,
31.198741988659886,
 31.209786660816327,
 31.205099598603987,
 31.20216773925252,
 31.206497529337366,
 31.21148990722265,
 31.21437415327006,
 31.21939679825386,
 31.216144105208066,
31.217641095744696,
 31.211150323294753,
];
  Future Getlocation()async{
    bool servise;
    Position per;
    servise=await Geolocator.isLocationServiceEnabled();
    if(servise==false){
      print(servise);
    }else if(await Geolocator.checkPermission()==false){
      print(await Geolocator.checkPermission());
      await Geolocator.requestPermission();
    }else{
      print('object');
    }
  }

  @override
 var position;
  pos()async{
    position= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }
  void initState() {
    for(int i=0;i<longtude.length;i++){
      mymarker.add(Marker(
          markerId: MarkerId('${i}'),
          position: LatLng(latitude[i],longtude[i]),
          onTap: ()=>print('object'),
          icon: BitmapDescriptor.defaultMarker

      )
      );

    }


    print(latitude.length);
    print(longtude.length);
    pos();
    Getlocation();
    //setmarkercostomeimage();
    getcurrentlocation();
    positionStream= Geolocator.getPositionStream().listen(
            (Position position) {
          setState(() {
            lat=position.latitude;
            long=position.latitude;
          });
      //    print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
        });
    super.initState();
  }
  CameraPosition _kGooglePlex;
  Position cl;
  StreamSubscription<Position> positionStream ;
  double lat;
  double long;
  Set<Marker> mymarker= {

  };
  getcurrentlocation()async{
    cl= await Geolocator.getCurrentPosition().then((value) => value);

    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom:14,
    );

    mymarker.add(Marker(
        markerId: MarkerId('100'),
        position: LatLng(lat,long),
        onTap: ()=>print('object'),
        icon: BitmapDescriptor.defaultMarkerWithHue( BitmapDescriptor.hueOrange)

    ),
       // BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5), 'assets/markers/pin-blue.png')


    );
    setState(() {
      lat=cl.latitude;
      long= cl.longitude;
    });

  }
  GoogleMapController _controller ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_kGooglePlex==null||lat==null?Center(child:CircularProgressIndicator(),) :
      Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: GoogleMap(
          markers: mymarker,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller=controller;
          },
        ),
      ),

  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
