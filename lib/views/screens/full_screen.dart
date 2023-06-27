import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:async_wallpaper/async_wallpaper.dart';

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
    fPath = '';
    count = 0;
  }

  int count = 0;
  double? _progress;

  void setWallpapers(String path) async {
    await AsyncWallpaper.setWallpaperFromFile(
      filePath: path,
      wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
      goToHome: true,
      toastDetails: ToastDetails.success(),
      errorToastDetails: ToastDetails.error(),
    );
  }

  // download wallpaper func

  String fPath = '';
  Future<String> downloadWallpaper() async {
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
        fPath = path;
        setState(() {
          _progress = null;
        });
      },
    ).then((value) {
      print('Download Successful');
      count++;
    });
    return fPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: count == 0
          ? ElevatedButton(
              onPressed: () {
                downloadWallpaper();
              },
              child: Text('Download Wallpaper'),
            )
          : ElevatedButton(
              onPressed: () {
                setWallpapers(fPath);
              },
              child: Text('Set Wallpaper')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.imgUrl), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
