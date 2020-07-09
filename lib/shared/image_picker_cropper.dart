import 'dart:io';

import 'package:farming_project/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'constants.dart';

class ImagePickerCropper extends StatefulWidget {

  ImagePickerCropper();

  @override
  _ImagePickerCropperState createState() => _ImagePickerCropperState();
}

class _ImagePickerCropperState extends State<ImagePickerCropper> {
  //active image file
  File _imageFile;

//select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
        ),
      ),
      body: (_imageFile == null)
          ? Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: consMedPadH,
                  ),
                  Container(
                    padding: EdgeInsets.all(consMedPadH),
                    child: Center(
                      child: Text(
                        "Select camera or gallery",
                        textAlign: TextAlign.center,
                        style: titleTextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: consMedPadH,
                  ),
                  Container(
                    padding: EdgeInsets.all(consMedPadH),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 120,
                            color: Colors.blueGrey,
                            child: IconButton(
                              icon: Icon(
                                Icons.photo_camera,
                                color: Colors.white70,
                                size: 100,
                              ),
                              onPressed: () {
                                _pickImage(ImageSource.camera);
                              },
                            ),
                          ),
                          flex: 1,
                        ),
                        SizedBox(
                          width: consSmallPad * 2,
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            color: Colors.blueGrey,
                            child: IconButton(
                              icon: Icon(
                                Icons.photo_library,
                                color: Colors.white70,
                                size: 100,
                              ),
                              onPressed: () {
                                _pickImage(ImageSource.gallery);
                              },
                            ),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : ListView(
              children: [
                if (_imageFile != null) ...[
                  Image.file(
                    _imageFile,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.5,
                  ),
                  SizedBox(
                    height: consMedPadH,
                  ),
                  RaisedButton(
                    child: Text("Upload"),
                    onPressed: () {
                      Navigator.pop(context, _imageFile);
                    },
                  )
                ],
              ],
            ),
    );
  }
}