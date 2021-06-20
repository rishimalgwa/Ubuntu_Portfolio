// import 'package:flutter/material.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

// class Resume extends StatefulWidget {
//   const Resume({Key key}) : super(key: key);

//   @override
//   _ResumeState createState() => _ResumeState();
// }

// class _ResumeState extends State<Resume> {
//   final url =
//       'https://drive.google.com/file/d/1NP6WFVsSOcoaMwOcHqY94efIIxv4oyrA/view?usp=sharing';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.pink,
//         height: 600,
//         width: 800,
//         child: const PDF().fromUrl(
//           url,
//           placeholder: (double progress) => Center(child: Text('$progress %')),
//           errorWidget: (dynamic error) => Center(child: Text(error.toString())),
//         ),
//       ),
//     );
//   }
// }
