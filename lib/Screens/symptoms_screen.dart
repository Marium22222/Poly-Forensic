import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SymptomsScreen extends StatefulWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

  @override
  State<SymptomsScreen> createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  String dropdownValue = 'Yes'; // Default value
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // You can handle the picked image file here
      print('Image picked from camera: ${pickedFile.path}');
    } else {
      print('No image selected from camera.');
    }
  }

  Future<void> openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // You can handle the picked image file here
      print('Image picked from gallery: ${pickedFile.path}');
    } else {
      print('No image selected from gallery.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Symptoms Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'BMI'),

            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Follicles in mm'),


            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Periods cycle missed"),
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Yes', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Text("Please upload an image of your acne"),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: openCamera,
                  child: Text('Open Camera'),
                ),
                ElevatedButton(
                  onPressed: openGallery,
                  child: Text('Upload'),
                ),
              ],
            ),

            Text("Please upload an image of your hirsutism"),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: openCamera,
                  child: Text('Open Camera'),
                ),
                ElevatedButton(
                  onPressed: openGallery,
                  child: Text('Upload'),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
