// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:bookbuzz/pages/MessagesList/components/image_preview.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({
    super.key,
    required this.camera,
    required this.action,
    this.secondaryCamera,
  });

  final Function action;

  final CameraDescription camera;
  final CameraDescription? secondaryCamera;
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  FlashMode? mode; // Movido para a classe como uma propriedade
  int cameraIndex = 0;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    if (widget.secondaryCamera != null) {
      _controller = CameraController(
        // Get a specific camera from the list of available cameras.
        widget.secondaryCamera!,
        // Define the resolution to use.
        ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );
    } else {
      _controller = CameraController(
        // Get a specific camera from the list of available cameras.
        widget.camera,
        // Define the resolution to use.
        ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );
    }

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
    _controller.setDescription(widget.secondaryCamera!);
    _controller.setFocusMode(FocusMode.auto);
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return Stack(
      children: [
        FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the preview.
              return CameraPreview(
                _controller,

              );
            } else {
              // Otherwise, display a loading indicator.
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height - 100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.secondaryCamera != null
                  ? FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppColors.whiteColor,
                      onPressed: () async {
                        try {

                          if (cameraIndex == 0) {
                            setState(() {
                              cameraIndex = 1;
                            });
                          } else {
                            setState(() {
                              cameraIndex = 0;
                            });
                          }
                          if (cameraIndex == 0) {
                            _controller.setDescription(widget.secondaryCamera!);
                          } else {
                            _controller.setDescription(widget.camera);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cameraswitch_outlined,
                          ),
                        ],
                      ),
                    )
                  : Container(),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                // Provide an onPressed callback.
                onPressed: () async {
                  // Take the Picture in a try / catch block. If anything goes wrong,
                  // catch the error.
                  try {
                    // Ensure that the camera is initialized.
                    await _initializeControllerFuture;

                    // Attempt to take a picture and then get the location
                    // where the image file is saved.
                    final image = await _controller.takePicture();
                    if (!mounted) return;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ImagePreview(
                        imagePath: image.path,
                        action: widget.action,
                      ),
                    ));
                    // await widget.action(image.path);
                    // Navigator.pop(context);
                  } catch (e) {
                    // If an error occurs, log the error to the console.
                    print(e);
                  }
                },
                child: const Icon(Icons.camera),
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                foregroundColor: AppColors.whiteColor,
                onPressed: () async {
                  try {
                    await _initializeControllerFuture;
                    setState(() {
                      mode = (mode == FlashMode.off || mode == null)
                          ? FlashMode.always
                          : FlashMode.off;
                    });
                    await _controller.setFlashMode(mode!);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      mode == FlashMode.always
                          ? Icons.flash_on
                          : Icons.flash_off,
                    ),
                    Text(mode == FlashMode.always ? 'On' : 'Off'),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
