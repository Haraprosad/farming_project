import 'package:farming_project/shared/box_shadows.dart';
import 'package:farming_project/shared/colors.dart';
import 'package:farming_project/shared/constants.dart';
import 'package:farming_project/shared/size_config.dart';
import 'package:farming_project/shared/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ProductDetailsUI extends StatefulWidget {
  @override
  _ProductDetailsUIState createState() => new _ProductDetailsUIState();
}

class _ProductDetailsUIState extends State<ProductDetailsUI> {
  //get current address process*****************
  Position _currentPosition;

  //*********************************
  int itemCount = 3;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeScreeTopPart(),
            HomeScreenBottom(context, itemCount)
          ],
        ),
      ),
    );
  }
}

class HomeScreeTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 320.0,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: Mclipper(),
            child: Container(
              height: 270.0,
              decoration: BoxDecoration(
                  color: Colors.white, boxShadow: [boxShadowCard]),
              child: Stack(
                children: <Widget>[
                  Image.asset("assets/images/cow_img.jpeg",
                      fit: BoxFit.cover, width: double.infinity),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          const Color(0x00000000),
                          const Color(0xD9333333)
                        ],
                            stops: [
                          0.0,
                          0.9
                        ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(0.0, 1.0))),
                    child: Padding(
                      padding: EdgeInsets.only(top: 120.0, left: 95.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Add Animal",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45.0,
                                fontFamily: "SF-Pro-Display-Bold"),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 270.0,
            right: -20.0,
            child: FractionalTranslation(
              translation: Offset(0.0, -0.5),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_downward,
                      color: Color(0xFFE52020),
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: RaisedButton(
                      onPressed: () {},
                      color: clearRed,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 80.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Product details",
                            style: buttonTextStyle,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Mclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 100.0);

    var controlpoint = Offset(35.0, size.height);
    var endpoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
        controlpoint.dx, controlpoint.dy, endpoint.dx, endpoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

//home screen bottom part

Widget HomeScreenBottom(BuildContext context, int itemCount) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: consMedPadH),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //Animal Name*******************************
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: clearRed,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              height: 25,
              width: 25,
              child: Icon(
                Icons.text_format,
                color: Colors.white,
                size: 14,
              ),
            ),
            SizedBox(
              width: consSmallPad,
            ),
            Text(
              "Animal Name",
              style: titleTextStyle,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(
          height: consSmallPad * 2,
        ),
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
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
                hintText: "Input Animal Name",
                hintStyle: hintTextStyle,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: consMedPad, vertical: consMedPad - 2)),
          ),
        ),
        SizedBox(
          height: consMedPadH,
        ),
        //Animal Price
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: clearRed,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              height: 25,
              width: 25,
              child: Icon(
                FontAwesomeIcons.moneyBill,
                color: Colors.white,
                size: 10,
              ),
            ),
            SizedBox(
              width: consSmallPad,
            ),
            Text(
              "Price",
              style: titleTextStyle,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(
          height: consSmallPad * 2,
        ),
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
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
                hintText: "Input Price",
                hintStyle: hintTextStyle,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: consMedPad, vertical: consMedPad - 2)),
          ),
        ),
        SizedBox(
          height: consMedPadH,
        ),

        //Phone Number
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: clearRed,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              height: 25,
              width: 25,
              child: Icon(
                Icons.phone,
                color: Colors.white,
                size: 14,
              ),
            ),
            SizedBox(
              width: consSmallPad,
            ),
            Text(
              "Phone",
              style: titleTextStyle,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(
          height: consSmallPad * 2,
        ),
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
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
                hintText: "Mobile Number",
                hintStyle: hintTextStyle,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: consMedPad, vertical: consMedPad - 2)),
          ),
        ),
        SizedBox(
          height: consMedPadH,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: clearRed,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              height: 25,
              width: 25,
              child: Icon(
                Icons.description,
                color: Colors.white,
                size: 14,
              ),
            ),
            SizedBox(
              width: consSmallPad,
            ),
            Text(
              "Description",
              style: titleTextStyle,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(
          height: consSmallPad * 2,
        ),
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
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
                hintText: "Input Description",
                hintStyle: hintTextStyle,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: consMedPad, vertical: consMedPad - 2)),
          ),
        ),
        //Description
        SizedBox(
          height: consMedPadH,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: clearRed,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              height: 25,
              width: 25,
              child: Icon(
                Icons.location_city,
                color: Colors.white,
                size: 14,
              ),
            ),
            SizedBox(
              width: consSmallPad,
            ),
            Text(
              "City",
              style: titleTextStyle,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(
          height: consSmallPad * 2,
        ),
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
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
                hintText: "Input City Name",
                hintStyle: hintTextStyle,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: consMedPad, vertical: consMedPad - 2)),
          ),
        ),
        //City
        SizedBox(
          height: consMedPadH,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: clearRed,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              height: 25,
              width: 25,
              child: Icon(
                Icons.calendar_today,
                color: Colors.white,
                size: 14,
              ),
            ),
            SizedBox(
              width: consSmallPad,
            ),
            Text(
              "Date",
              style: titleTextStyle,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(
          height: consSmallPad * 2,
        ),
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
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
                hintText: "Input Date",
                hintStyle: hintTextStyle,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: consMedPad, vertical: consMedPad - 2)),
          ),
        ),
        //Image
        SizedBox(
          height: consMedPadH,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: clearRed,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              height: 25,
              width: 25,
              child: Icon(
                Icons.image,
                color: Colors.white,
                size: 14,
              ),
            ),
            SizedBox(
              width: consSmallPad,
            ),
            Text(
              "Image",
              style: titleTextStyle,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(
          height: consSmallPad * 2,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [boxShadowForInputText],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            children: [
              Container(
                height: 46,
                child: RaisedButton(
                  child: Text("Choose File"),
                  onPressed: () {
                    //todo
                  },
                ),
              ),
              SizedBox(
                width: consSmallPad,
              ),
              Text(
                "No file chosen",
                style: hintTextStyle,
              ),
            ],
          ),
        ),

        //Animal Gallery
        SizedBox(
          height: consMedPadH,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: clearRed,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              height: 25,
              width: 25,
              child: Icon(
                Icons.collections,
                color: Colors.white,
                size: 14,
              ),
            ),
            SizedBox(
              width: consSmallPad,
            ),
            Text(
              "Animal Gallery(Optional)",
              style: titleTextStyle,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        getListViewBuilder(itemCount),
        SizedBox(
          height: consSmallPad * 2,
        ),
        InkWell(
          onTap: () {
            //todo
          },
          child: Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [boxShadowForInputText],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Center(
                child: Icon(
              Icons.add,
              color: clearRed,
            )),
          ),
        ),

        //Animal Gallery(optional)
        SizedBox(
          height: consMedPadH * 1.5,
        ),
        Container(
          height: 40,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            boxShadow: [boxShadowForInputText],
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: RaisedButton(
            color: clearRed,
            onPressed: () {
              //todo
            },
            child: Text(
              "Submit",
              style: buttonTextStyle,
            ),
          ),
        ),
        SizedBox(
          height: consMedPadH * 2,
        )
      ],
    ),
  );
}

// get listview for image gallery
Widget getListViewBuilder(int itemCount) {
  return Container(
    height: itemCount * 60.0,
    child: ListView.builder(
        itemCount: itemCount,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [boxShadowForInputText],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 46,
                      child: RaisedButton(
                        child: Text("Choose File"),
                        onPressed: () {
                          //todo
                        },
                      ),
                    ),
                    SizedBox(
                      width: consSmallPad,
                    ),
                    Text(
                      "No file chosen",
                      style: hintTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: consSmallPad * 2,
              ),
            ],
          );
        }),
  );
}
