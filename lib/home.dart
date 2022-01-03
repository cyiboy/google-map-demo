import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/repository.dart';


import 'app/core/p.dart';
import 'app/core/utils/constants.dart';
import 'componect/default_button.dart';
import 'map_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    print('i was co');
    P.request.locationController.addListener(() {
      print('i was co');
      autoComplete();
    });
  }

  List<dynamic> placeList = [];
  void Closs() {
    print('i was co');
  }

  Future<void> autoComplete() async {
    print('i was here');
    await RequestRepository.getLoaction(P.request.locationController.text)
        .then((value) {
      if (value.status == 200) {
        setState(() {
          placeList = value.data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Location', style: TextStyle( color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              TextField(
                onTap: () async {},
                controller: P.request.locationController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Enter Location',
                  contentPadding: EdgeInsets.only(
                    left: 15,
                    top: 16,
                  ),
                  icon: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 15),
                      child: Image.asset(
                        'assets/icon/location.png',
                        width: 30,
                        height: 30,
                      )),
                ),
              ),
              SizedBox(height: 20,),
              DefaultButton(text: 'Search', press: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MapScreen()));
              },),
              SizedBox(height: 20,),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: placeList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      await P.request.setPickCoordinates(placeList[index]);
                      placeList = [];
                      // if(P.request.locationController.text != '' && P.request.destinationController.text != ''){
                      //   P.request.changeModal(Modal.SELECT_CAR_TYPE_MODAL);
                      //   P.request.getRoute(origin: P.request.pickupCoordinates, destination: P.request.destinationCoordinates);
                      // }
                    },



                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.white,
                        ),
                        radius: 15,
                        backgroundColor: blueGrey,
                      ),
                      title: Text(placeList[index]['description']),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
