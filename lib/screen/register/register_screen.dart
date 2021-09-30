//
// // Dart imports:
// import 'dart:io';
//
// // Flutter imports:
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// // Package imports:
// import 'package:flutter_state_notifier/flutter_state_notifier.dart';
// import 'package:provider/provider.dart';
//
// // Project imports:
// import 'package:book_instagram_app/repository/model/model.dart';
// import 'package:book_instagram_app/repository/database/db_bloc.dart';
// import 'package:book_instagram_app/screen/register/register_screen_state.dart';
// import 'children/register_app_bar.dart';
// import 'children/register_no_image.dart';
// import 'children/register_photo_button.dart';
// import 'children/register_textfield.dart';
//
// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StateNotifierProvider<RegisterScreenController, RegisterScreenState>(
//       create: (_) => RegisterScreenController(
//         context: context,
//         todo: Todo(),
//         //todoBloc: TodoBloc(),
//       ),
//       builder: (context, _) {
//         final images = context.select<RegisterScreenState, String>((state) => state.imagePath);
//         return Scaffold(
//           appBar: RegisterAppBar(
//             onTap: () => context.read<RegisterScreenController>().onTapPost(),
//           ),
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child: images.isEmpty
//                     ? const NoImageWidget()
//                     : SizedBox(
//                         width: MediaQuery.of(context).size.width / 1.1,
//                         height: MediaQuery.of(context).size.width / 1.6,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: FileImage(
//                                 File(images),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//               ),
//               RegisterTextField(
//                onChanged: context.read<RegisterScreenController>().setContents,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   PhotoWidget(
//                     icon: Icons.camera_alt_outlined,
//                     text: ' 写真を撮る',
//                     onTap: () =>
//                         context.read<RegisterScreenController>().getCamera(),
//                   ),
//                   PhotoWidget(
//                     icon: Icons.photo_size_select_actual_outlined,
//                     text: ' 写真を選択',
//                     onTap: () =>
//                         context.read<RegisterScreenController>().getImage(),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
