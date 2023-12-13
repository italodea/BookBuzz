// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:bookbuzz/general_components/my_vertical_divider.dart';
import 'package:bookbuzz/pages/MessagesList/components/camera_screen.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class InputMessageWidget extends StatefulWidget {
  const InputMessageWidget({
    Key? key,
    required this.messageEditingController,
    required this.handleSubmit,
  }) : super(key: key);

  final TextEditingController messageEditingController;
  final Function(String message, String imagePath) handleSubmit;

  @override
  State<InputMessageWidget> createState() => _InputMessageWidgetState();
}

class _InputMessageWidgetState extends State<InputMessageWidget> {
  final ImagePicker _picker = ImagePicker();

  String imageUrlAttachment = "";
  String imagePath = "";

  void chooseCameraOrGalleryDialog() {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(
        maxHeight: 200,
      ),
      builder: (BuildContext context) {
        return Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Escolha uma opção", style: AppText.titleLarge),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 30,
                        ),
                        Text(
                          "Câmera",
                          style: AppText.titleMedium,
                        ),
                      ],
                    ),
                    onTap: () {
                      _getImageAndUploadFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  MyVerticalDivider(
                    height: 70,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        Icon(
                          Icons.photo,
                          size: 30,
                        ),
                        Text(
                          "Galeria",
                          style: AppText.titleMedium,
                        ),
                      ],
                    ),
                    onTap: () {
                      _getImageAndUploadFromGallery();
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> updateImagePath(String path) async {
    setState(() {
      imagePath = path;
    });

    File pickedFile = File(path);
    if (pickedFile.existsSync()) {
      // Faça o upload da imagem para o Firebase Storage
      setState(() {
        imageUrlAttachment = "loading";
      });
      final file = pickedFile;
      print(file);
      final storage = firebase_storage.FirebaseStorage.instance;
      print(storage);
      final ref = storage.ref().child('uploads/${DateTime.now()}.png');
      print(ref);
      await ref.putFile(File(file.path));
      print("put file");

      // Recupere a URL da imagem no Firebase Storage
      final imageUrl = await ref.getDownloadURL();

      print("____________");
      print(imageUrl);
      print("____________");

      setState(() {
        imageUrlAttachment = imageUrl;
      });

      // Adicione o código para processar ou exibir a imagem, como enviar a URL para o Firestore, etc.
    }
  }

  Future<void> _getImageAndUploadFromCamera() async {
    print("Começou");

    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    var secondaryCamera;
    if (cameras.length > 1) {
      secondaryCamera = cameras[1];
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CameraScreen(
          camera: firstCamera,
          secondaryCamera: secondaryCamera,
          action: updateImagePath,
        ),
      ),
    );
    // final pickedFile = await _picker.pickImage(
    //   source: ImageSource.camera,
    // );
    // print(pickedFile);
    // if (pickedFile != null) {
    //   // Faça o upload da imagem para o Firebase Storage
    //   setState(() {
    //     imageUrlAttachment = "loading";
    //   });
    //   final file = pickedFile;
    //   print(file);
    //   final storage = firebase_storage.FirebaseStorage.instance;
    //   print(storage);
    //   final ref = storage.ref().child('uploads/${DateTime.now()}.png');
    //   print(ref);
    //   await ref.putFile(File(file.path));
    //   print("put file");

    //   // Recupere a URL da imagem no Firebase Storage
    //   final imageUrl = await ref.getDownloadURL();

    //   print("____________");
    //   print(imageUrl);
    //   print("____________");

    //   setState(() {
    //     imageUrlAttachment = imageUrl;
    //   });

    //   // Adicione o código para processar ou exibir a imagem, como enviar a URL para o Firestore, etc.
    // }
  }

  Future<void> _getImageAndUploadFromGallery() async {
    print("Começou");
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    print(pickedFile);
    if (pickedFile != null) {
      // Faça o upload da imagem para o Firebase Storage
      setState(() {
        imageUrlAttachment = "loading";
      });
      final file = pickedFile;
      print(file);
      final storage = firebase_storage.FirebaseStorage.instance;
      print(storage);
      final ref = storage.ref().child('uploads/${DateTime.now()}.png');
      print(ref);
      await ref.putFile(File(file.path));
      print("put file");

      // Recupere a URL da imagem no Firebase Storage
      final imageUrl = await ref.getDownloadURL();

      print("____________");
      print(imageUrl);
      print("____________");

      setState(() {
        imageUrlAttachment = imageUrl;
      });

      // Adicione o código para processar ou exibir a imagem, como enviar a URL para o Firestore, etc.
    }
  }

  Widget buildAttachment() {
    if (imagePath != "") {
      return Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 12,
            ),
            height: 150,
            child: Image.file(
              File(imagePath),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 3,
              vertical: 18,
            ),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.attach_file_outlined,
              color: AppColors.blackColor,
            ),
          ),
          InkWell(
            onTap: () => setState(() {
              imageUrlAttachment = "";
              imagePath = "";
            }),
            child: Container(
              margin: EdgeInsets.only(
                left: 3,
                right: 3,
                bottom: 100,
              ),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.close,
                color: AppColors.blackColor,
              ),
            ),
          )
        ],
      );
    }
    if (imageUrlAttachment != "") {
      if (imageUrlAttachment == "loading") {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 12,
          ),
          height: 150,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 12,
              ),
              height: 150,
              child: Image.network(
                imageUrlAttachment,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 3,
                vertical: 18,
              ),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.attach_file_outlined,
                color: AppColors.blackColor,
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                imageUrlAttachment = "";
                imagePath = "";
              }),
              child: Container(
                margin: EdgeInsets.only(
                  left: 3,
                  right: 3,
                  bottom: 100,
                ),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.blackColor,
                ),
              ),
            )
          ],
        );
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAttachment(),
          SizedBox(
            width: double.infinity,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 150, minHeight: 60),
              child: Row(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.79,
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                controller: widget.messageEditingController,
                                cursorColor: AppColors.secondaryColor,
                                style: TextStyle(color: Colors.black),
                                maxLines:
                                    null, // Set maxLines to null to allow dynamic sizing
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.only(
                                    top: 20,
                                    bottom: 20,
                                    left: 20,
                                    right: 50,
                                  ),
                                  filled: true,
                                  fillColor: AppColors.whiteColor,
                                  labelText: 'Mensagem...',
                                  hintStyle:
                                      TextStyle(color: AppColors.blackColor),
                                  labelStyle:
                                      TextStyle(color: AppColors.blackColor),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.secondaryColor,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 5),
                                    borderRadius: BorderRadius.circular(12),
                                    gapPadding: 8.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 9,
                                left: MediaQuery.of(context).size.width * 0.79 -
                                    50,
                              ),
                              child: IconButton(
                                onPressed: chooseCameraOrGalleryDialog,
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      onPressed: () async {
                        await widget.handleSubmit(
                            widget.messageEditingController.text,
                            imageUrlAttachment);
                        if (imageUrlAttachment != "") {
                          setState(() {
                            imageUrlAttachment = "";
                            imagePath = "";
                          });
                        }
                      },
                      icon: const Icon(Icons.send_rounded),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
