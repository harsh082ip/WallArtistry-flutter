// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_downloader/image_downloader.dart';
// import 'package:open_file/open_file.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
// import 'package:open_file/open_file.dart';
// import 'package:open_filex/open_filex.dart';
// import 'package:open_file/open_file.dart';
// import 'package:url_launcher/url_launcher.dart';

// import 'package:open_file/open_file.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class FullScreen extends StatefulWidget {
  String imgUrl;
  FullScreen({super.key, required this.imgUrl});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Future<void> setWallpaperFromFile(
  //     String wallpaperUrl, BuildContext context) async {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text("Downloading Started...")));
  //   try {
  //     // Saved with this method.
  //     print('here');
  //     var imageId = await ImageDownloader.downloadImage(widget.imgUrl);

  //     print(imageId);
  //     print('now here');
  //     if (imageId == null) {
  //       print('unfortunately here');
  //       return;
  //     }
  //     // Below is a method of obtaining saved image information.
  //     var fileName = await ImageDownloader.findName(imageId);
  //     var path = await ImageDownloader.findPath(imageId);
  //     var size = await ImageDownloader.findByteSize(imageId);
  //     var mimeType = await ImageDownloader.findMimeType(imageId);
  //     print('till now done');
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Downloaded Sucessfully"),
  //       action: SnackBarAction(
  //           label: "Open",
  //           onPressed: () {
  //             OpenFile.open(path);
  //           }),
  //     ));
  //     print("IMAGE DOWNLOADED");
  //   } on PlatformException catch (error) {
  //     print(error);
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Error Occured - $error")));
  //   }
  // }

  // Future<void> openFile(String filePath) async {
  //   print('got the path: $filePath');
  //   if (await canLaunchUrl(Uri.file(filePath))) {
  //     print('can launch');
  //     await launchUrl(Uri.file(filePath));
  //   } else {
  //     print('Could not launch $filePath');
  //   }
  // }

  // void openFile(String filePath) async {
  //   print('func called');
  //   await OpenFile.open(
  //           '/storage/emulated/0/Download/pexels-photo-17325851-1.jpeg')
  //       .then((value) => print('func ended'));
  // }

  void openFile(String filePath) async {
    print('func called');
    await OpenFile.open(filePath).then((value) => print('func ended'));
  }

  Future<void> requestStoragePermission(Permission permission) async {
    final status = await permission.request();
    if (status.isGranted) {
      print('granted');
      // } else if (await Permission.storage.request().isPermanentlyDenied) {
      //   print('Permanently denied');
    } else {
      print('Not granted');
    }
  }

  @override
  void initState() {
    super.initState();
    requestStoragePermission(Permission.photos);
  }

  double? _progress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          FileDownloader.downloadFile(
            url: widget.imgUrl,
            onProgress: (fileName, progress) {
              setState(
                () {
                  _progress = progress;
                },
              );
            },
            onDownloadCompleted: (path) async {
              print('path: $path');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('File Saved at: $path'),
                ),
              );
              // OpenFile.open("$path");
              openFile(path);

              setState(() {
                _progress = null;
              });
            },
          ).then((value) {
            print('Download Successful');
          });
        },
        child: Text('Set Wallpaper'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.imgUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
