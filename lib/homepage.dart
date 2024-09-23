import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper/wallpaper.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final controller = ScreenshotController();
  Future<void> takeScreenshot() async {
    try {
      await controller.capture(delay: const Duration(milliseconds: 10)).then(
        (image) async {
          if (image != null) {
            final directory = await getApplicationDocumentsDirectory();
            final imagePath =
                await File('${directory.path}/image.png').create();
            await imagePath.writeAsBytes(image);
            print('=========>$imagePath');
            final xFileImage = XFile(imagePath.path);
            await Share.shareXFiles([xFileImage]);
            await Wallpaper.homeScreen(
                fileExtension: ImageFormat.png, imageName: imagePath.path);
          }
        },
      );
    } catch (e) {
      print('==========> $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Screenshot(
                controller: controller,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      image: const DecorationImage(
                          image: AssetImage('assets/images/men.jpg'),
                          fit: BoxFit.contain),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    takeScreenshot();
                  },
                  child: const Text('save picture & share'))
            ],
          ),
        ),
      ),
    );
  }
}
