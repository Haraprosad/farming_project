import 'package:auto_route/auto_route.dart';
import 'package:farming_project/routes/routes.gr.dart';
import 'package:farming_project/shared/box_shadows.dart';
import 'package:farming_project/shared/colors.dart';
import 'package:farming_project/shared/constants.dart';
import 'package:farming_project/shared/image_picker_cropper.dart';
import 'package:farming_project/shared/size_config.dart';
import 'package:farming_project/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';

class AddAnimalUI extends StatefulWidget {
  @override
  _AddAnimalUIState createState() => _AddAnimalUIState();
}

class _AddAnimalUIState extends State<AddAnimalUI> {
  //**************step-01: get location**************
  Position _position;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  String _currentAddress;
  //*************************************************
  var globalKey = GlobalKey<ScaffoldState>();
  int groupValue = 1;
  var imgProfile;
  List<String> categoriesName = [
    "Cow",
    "Buffalo",
    "Goat",
    "Sheep",
    "Horse",
    "Others"
  ];
  String selectedCategoryName = "Cow";
  List<String> madisName = ["Jhang Mandi", "Gojra Mandi"];
  String selectedMadi = "Jhang Mandi";

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: consSmallPad * 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //**************1.Profile pic upload portion*****************
              SizedBox(
                height: consMedPadH * 2,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(
                                width: 3,
                                color: clearBlue,
                                style: BorderStyle.solid)),
                        child: Center(
                          child: Icon(
                            Icons.camera_alt,
                            size: 60,
                            color: clearBlue,
                          ),
                        ),
                      ),
                      onTap: () {
                        ExtendedNavigator.of(context)
                            .pushNamed(Routes.imagePickerCropper);
                        //todo
                      },
                    ),
                    SizedBox(
                      height: consSmallPad * 2,
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: [boxShadowForInputText],
                      ),
                      child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: RaisedButton(
                          color: clearBlue,
                          onPressed: () {
                            //todo
                          },
                          child: Text(
                            "Take Picture",
                            style: buttonTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //*************************************
              SizedBox(
                height: consMedPadH,
              ),
              //****************2.Mobile and price input row *******
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [boxShadowForInputText],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLines: null,
                        onChanged: (value) {
                          //todo
                        },
                        style: titleTextStyle,
                        decoration: InputDecoration(
                            hintText: "Mobile Number",
                            hintStyle: hintTextStyle,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: consMedPad,
                                vertical: consMedPad - 2)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: consSmallPad * 2,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [boxShadowForInputText],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLines: null,
                        onChanged: (value) {
                          //todo
                        },
                        style: titleTextStyle,
                        decoration: InputDecoration(
                            hintText: "Price",
                            hintStyle: hintTextStyle,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: consMedPad,
                                vertical: consMedPad - 2)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: consMedPadH,
              ),

              //**********************************************
              //********3.Age in month row*****************
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [boxShadowForInputText],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLines: null,
                        onChanged: (value) {
                          //todo
                        },
                        style: titleTextStyle,
                        decoration: InputDecoration(
                            hintText: "Age In Month",
                            hintStyle: hintTextStyle,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: consMedPad,
                                vertical: consMedPad - 2)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: consSmallPad * 2,
                  ),
                  //********************************************
                  Container(
                      padding: EdgeInsets.only(left: consSmallPad * 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: selectedCategoryName,
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  selectedCategoryName = value;
                                });
                              },
                              items: categoriesName
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      )),
                ],
              ),

              SizedBox(
                height: consMedPadH,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [boxShadowForInputText],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                              //todo
                            });
                          },
                        ),
                        Text(
                          "Male",
                          style: titleTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: 2,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                              //todo
                            });
                          },
                        ),
                        Text(
                          "Female",
                          style: titleTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //***************************************
              SizedBox(
                height: consMedPadH,
              ),
              //*************4.location row*************************
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        _getCurrentLocation();
                      },
                      child: Container(
                        padding: EdgeInsets.all(consSmallPad * 2),
                        decoration: BoxDecoration(
                          boxShadow: [boxShadowForInputText],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: clearRed,
                            ),
                            SizedBox(
                              width: consSmallPad,
                            ),
                            (_currentAddress != null)
                                ? Text(
                                    _currentAddress,
                                    style: titleTextStyle,
                                  )
                                : Text(
                                    "Location",
                                    style: titleTextStyle,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: consSmallPad * 2,
                  ),
                  //********************************************
                  Container(
                      padding: EdgeInsets.only(left: consSmallPad * 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              value: selectedMadi,
                              onChanged: (value) {
                                setState(() {
                                  selectedMadi = value;
                                });
                              },
                              items: madisName
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              //*********************************
              SizedBox(
                height: consMedPadH,
              ),
              //*********5.Description Section *******************
              Container(
                decoration: BoxDecoration(
                  boxShadow: [boxShadowForInputText],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (value) {
                    //todo
                  },
                  style: titleTextStyle,
                  decoration: InputDecoration(
                      hintText: "Description",
                      hintStyle: hintTextStyle,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: consMedPad, vertical: consMedPad - 2)),
                ),
              ),
              //******************************************
              SizedBox(
                height: consMedPadH,
              ),
              //*************6.Gallery Section******************
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: [boxShadowForInputText],
                    ),
                    child: ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: RaisedButton(
                        color: clearBlue,
                        onPressed: () {
                          //todo
                        },
                        child: Text(
                          "Add Videos or More Pictures",
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: consSmallPad * 2,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(
                            width: 3,
                            color: clearBlue,
                            style: BorderStyle.solid)),
                    child: Center(
                      child: Icon(
                        Icons.camera_alt,
                        size: 60,
                        color: clearBlue,
                      ),
                    ),
                  ),
                ],
              ),
              //*************************************
              SizedBox(
                height: consMedPadH,
              ),
              //*******************7.Button Section*********
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [boxShadowForInputText],
                ),
                child: ButtonTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: RaisedButton(
                    color: clearBlue,
                    onPressed: () {
                      //todo
                    },
                    child: Text(
                      "Upload Animal",
                      style: buttonTextStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: consMedPadH * 2,
              )
              //*****************************************
            ],
          ),
        ),
      ),
    );

  }

  //**************step-02: get location**************
  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _position = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _position.latitude, _position.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = "${place.subAdministrativeArea}";
      });
    } catch (e) {
      print(e);
    }
  }


//*************************************************
//upload image

  void uploadImage() async {
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(
        builder: (context) => ImagePickerCropper(),
      ),
    );

    if (result != null && result != "NO") {
      setState(() {
        imgProfile = result;
      });
    }
  }
}

//**************** BottomSheet*******************888

