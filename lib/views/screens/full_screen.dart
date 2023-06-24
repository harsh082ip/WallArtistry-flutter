import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_downloader/image_downloader.dart';
// import 'package:open_file/open_file.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
// import 'package:open_file/open_file.dart';
// import 'package:open_filex/open_filex.dart';
import 'package:open_file/open_file.dart';

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
            onDownloadCompleted: (path) {
              print('path: $path');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('File Saved at: $path'),
                ),
              );
              OpenFile.open("$path");

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
