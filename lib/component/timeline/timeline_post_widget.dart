// Dart imports:
import 'dart:typed_data';
import 'dart:ui';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
    required this.contents,
    required this.imagePath,
  }) : super(key: key);

  final String contents;
  final String imagePath;

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
// class PostWidget extends StatelessWidget {
//   const PostWidget({
//     Key? key,
//     required this.contents,
//     required this.imagePath,
//   }) : super(key: key);
//
//   final String contents;
//   final String imagePath;

  Future<Uint8List> SharedPrefRead() async {
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    //String imagePath = prefs.getString('key');

    ///imageのpathをByteDataに変換
    ByteData byte = await rootBundle.load(widget.imagePath);

    ///ByteDataをUint8List変換
    final Uint8List list = byte.buffer.asUint8List();
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 5),
                        blurRadius: 8.0,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                // Image.memory(
                //   imageFile.readAsBytesSync(),
                // ),

                // Image.memory(
                //   //imageFile.readAsBytesSync(),
                //   widget.imagePath
                // ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    widget.contents,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
