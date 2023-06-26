import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
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

  void openFile(String filePath) async {
    print('func called');
    await OpenFile.open(filePath).then((value) => print('func ended'));
  }

  Future<void> requestStoragePermission(Permission permission) async {
    final status = await permission.request();
    if (status.isGranted) {
      print('granted');
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

              openFile(path);

              setState(() {
                _progress = null;
              });
            },
          ).then((value) {
            print('Download Successful');
          });
        },
        child: Text('Download Wallpaper'),
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
