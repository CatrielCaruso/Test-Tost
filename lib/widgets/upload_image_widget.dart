import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageWidget extends StatefulWidget {
  final Function getFile;

  final File? fileImage;

  const UploadImageWidget({
    Key? key,
    required this.getFile,
    this.fileImage,
  }) : super(key: key);

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  // late double profileHeight = MediaQuery.of(context).size.height * 15 / 100;
  // late double defaultMargin = MediaQuery.of(context).size.height * 2 / 100;

  XFile? _image;
  final picker = ImagePicker();

  Future<void> _imgFromGallery() async {
    ImageSource? imagenSourceSelected;
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 5,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Imagen',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      imagenSourceSelected = ImageSource.camera;
                      onSelectedImagePicker(imagenSourceSelected);
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Text(
                          'Camara',
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.camera_alt,
                          //color: ConstantData.primaryColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      imagenSourceSelected = ImageSource.gallery;
                      onSelectedImagePicker(imagenSourceSelected);
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Galeria',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.photo_album,
                          //color: ConstantData.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> onSelectedImagePicker(ImageSource? imagenSourceSelected) async {
    if (imagenSourceSelected == null) return;
    XFile? image =
        // ignore: deprecated_member_use
        await ImagePicker().pickImage(source: imagenSourceSelected);
    if (image == null) return;
    setState(() {
      _image = image;
    });
  }

  Widget getProfileImage() {
    if (_image != null && _image!.path.isNotEmpty) {
      widget.getFile(
        File(_image!.path),
      );

      return Image.file(
        File(_image!.path),
        fit: BoxFit.cover,
      );
    } else {
      return (widget.fileImage == null)
          ? Image.asset(
              'assets/img/upload_image.png',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            )
          : SizedBox(
              width: 150,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(119),
                child: Image.file(
                  widget.fileImage!,
                ),
              ),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _imgFromGallery,
      child: SizedBox(
        width: 150,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: getProfileImage(),
        ),

        //  Container(
        //   alignment: Alignment.center,
        //   width: 119,
        //   height: 119,
        //   child: InkWell(
        //     onTap: _imgFromGallery,
        //     child: SizedBox(
        //       child: ,
        //     ),
        //   ),
      ),
    );
  }
}
