import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poly_forensic/reusable_widgets/round_image.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;

class UserImage extends StatefulWidget {
  //const UserImage({Key? key}) : super(key: key);

  final Function(String imageUrl) onFileChanged;

  UserImage({
    required this.onFileChanged,
  });

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {

  final ImagePicker _picker = ImagePicker();
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (imageUrl == null)
          Icon(Icons.image, size: 80, color: Theme.of(context).primaryColor),

        if (imageUrl != null)
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => _pickImage(ImageSource.gallery),
            child: Image.file(File(imageUrl!),height: MediaQuery.sizeOf(context).height*0.3,width:MediaQuery.sizeOf(context).height*0.95,fit: BoxFit.fill,),
            // child: AppRoundImage.url(
            //     imageUrl!,
            //     height: 80,
            //     width: 80
            // ),
          ),

        InkWell(
            onTap: () => _pickImage(ImageSource.gallery),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(imageUrl != null
                  ? "Change Photo"
                  : "Select Photo",
                style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
              ),
            )
        )

      ],
    );
  }

  // Future _selectPhoto() async {
  //   await showModalBottomSheet(context: context, builder: (context) => BottomSheet(
  //     builder: (context) => Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         ListTile(
  //           leading: Icon(Icons.filter),
  //           title: Text("Pick a File"),
  //           onTap: () {
  //             Navigator.of(context).pop();
  //             _pickImage(ImageSource.gallery);
  //           },
  //         )
  //       ],
  //
  //     ),
  //     onClosing: () {},
  //   )
  //   );
  // }

  Future _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 50);
    imageUrl=pickedFile!.path;
    setState(() {

    });
    if(pickedFile == null) {
      return "false";
    }

    // var file = await ImageCropper().cropImage(sourcePath: pickedFile.path, aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    // if(file == null) {
    //   return "false";
    // }
    //file = (await compressImage(file.path, 35)) as CroppedFile?;
    // await _uploadFile(file!.path);
    print(pickedFile!.path);
  }

  /*Future<XFile> compressImage(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path, '${DateTime.now()}.${p.extension(path)}');

    final result = await FlutterImageCompress.compressAndGetFile(
        path,
        newPath,
        quality: quality
    );
    return result!;
  }*/

  // Future _uploadFile(String path) async {
  //   final ref = storage.FirebaseStorage.instance.ref()
  //       .child('image')
  //       .child('${DateTime.now().toIso8601String() + p.basename(path)}');
  //
  //   final result = await ref.putFile(File(path));
  //   final fileUrl = await result.ref.getDownloadURL();
  //
  //   setState(() {
  //     imageUrl = fileUrl;
  //   });
  //
  //   widget.onFileChanged(fileUrl);
  // }
}
