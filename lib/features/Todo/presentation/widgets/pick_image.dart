import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key, required this.image});
  final Uint8List? image;
  @override
  State<PickImage> createState() => _PickImageState(this.image);
}

class _PickImageState extends State<PickImage> {
  _PickImageState(this.image);
  Uint8List? image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image != null
            ? CircleAvatar(radius: 100, backgroundImage: MemoryImage(image!))
            : const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://cdn1.iconfinder.com/data/icons/metro-ui-dock-icon-set--icons-by-dakirby/512/User_No-Frame.png'),
              ),
        Positioned(
          bottom: 0,
          left: 140,
          child: IconButton(
            onPressed: () {
              showImagePicker(context);
            },
            icon: const Icon(Icons.camera),
          ),
        ),
      ],
    );
  }

  void showImagePicker(BuildContext context) {
    showBottomSheet(
        backgroundColor: const Color.fromARGB(255, 112, 109, 109),
        context: context,
        builder: (builder) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        _pickImageGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/album.png',
                              width: 75,
                              height: 75,
                            ),
                            const Text(
                              'Gallery',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        _pickImageCamera();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/camera.png',
                              width: 75,
                              height: 75,
                            ),
                            const Text(
                              'Camera',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future _pickImageGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  Future _pickImageCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
