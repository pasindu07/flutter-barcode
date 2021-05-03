
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  // File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    // final File imageFile = getImageFile();
    
    setState(() {
      if (pickedFile != null) {
        // _image = File(pickedFile.path);
        final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(File(pickedFile.path));
        final BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();
        detectImage(visionImage,barcodeDetector);
        
      } else {
        print('No image selected.');
      }
    });
  }

//used to detect the captured image by the barcode detector
  Future<void> detectImage(FirebaseVisionImage visionImage,BarcodeDetector barcodeDetector) async{
    final List<Barcode> barcodes = await barcodeDetector.detectInImage(visionImage);
    printBarcodes(barcodes);
    // return barcodes;
  }

//detetcted raw values will be printed
  void printBarcodes(List<Barcode> barcodes){
    for(Barcode barcode in barcodes){
      print(barcode.rawValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: ElevatedButton.icon(
              onPressed: getImage, 
              icon: Icon(Icons.camera), 
              label: Text("Scan Barcodes"),),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: getImage,
      //   tooltip: 'Pick Image',
      //   child: Icon(Icons.add_a_photo),
      // ),
    );
  }
}

// _image == null ? Text('No image selected.') : Image.file(_image),