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
    homeCount = 0;
    lockCount = 0;
    bothCount = 0;
  }

  int count = 0;
  int homeCount = 0;
  int lockCount = 0;
  int bothCount = 0;
  double? _progress;

  Future<void> _showMyDialog() async {
    print('in dialogue box');
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Screen😊'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('In which screen you would like to set the Wallpaper'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Home Screen'),
              onPressed: () {
                homeCount++;
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Lock Screen'),
              onPressed: () {
                lockCount++;
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Both'),
              onPressed: () {
                bothCount++;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void setWallpapers(String path, String screen) async {
    if (screen == 'Home') {
      await AsyncWallpaper.setWallpaperFromFile(
        filePath: path,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: true,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      );
    } else if (screen == 'lock') {
      await AsyncWallpaper.setWallpaperFromFile(
        filePath: path,
        wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
        goToHome: true,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      );
    } else {
      await AsyncWallpaper.setWallpaperFromFile(
        filePath: path,
        wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
        goToHome: true,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      );
    }
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
                _showMyDialog().then((value) {
                  if (homeCount > 0) {
                    setWallpapers(fPath, 'Home');
                  } else if (lockCount > 0) {
                    setWallpapers(fPath, 'lock');
                  } else if (bothCount > 0) {
                    setWallpapers(fPath, 'both');
                  } else {
                    print('Some Error Occured');
                  }
                });
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
