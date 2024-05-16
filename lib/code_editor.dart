// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter/services.dart';
// import 'package:html/parser.dart' as htmlParser;
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:webview_flutter/webview_flutter.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('HTML Editor & Viewer'),
//         ),
//         body: HtmlEditor(),
//       ),
//     );
//   }
// }

// class HtmlEditor extends StatefulWidget {
//   @override
//   _HtmlEditorState createState() => _HtmlEditorState();
// }

// class _HtmlEditorState extends State<HtmlEditor> {
//   TextEditingController _htmlController = TextEditingController();
//   TextEditingController _cssController = TextEditingController();
//   TextEditingController _jsController = TextEditingController();
//   WebViewController? _webViewController;
//   bool _isWebViewReady = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HTML Editor & Viewer'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ResizableWidget(
//             child: SingleChildScrollView(
//               child: TextField(
//                 controller: _htmlController,
//                 decoration: InputDecoration(labelText: 'Enter HTML Code'),
//                 keyboardType: TextInputType.multiline,
//                 maxLines: null,
//                 onChanged: (_) => _loadHtmlContent(),
//               ),
//             ),
//           ),
//           ResizableWidget(
//             child: SingleChildScrollView(
//               child: TextField(
//                 controller: _cssController,
//                 decoration: InputDecoration(labelText: 'Enter CSS Code'),
//                 keyboardType: TextInputType.multiline,
//                 maxLines: null,
//                 onChanged: (_) => _loadHtmlContent(),
//               ),
//             ),
//           ),
//           ResizableWidget(
//             child: SingleChildScrollView(
//               child: TextField(
//                 controller: _jsController,
//                 decoration: InputDecoration(labelText: 'Enter JavaScript Code'),
//                 keyboardType: TextInputType.multiline,
//                 maxLines: null,
//                 onChanged: (_) => _loadHtmlContent(),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Stack(
//               children: [
//                 SizedBox(
//                   height: 400, // Set a fixed height or adjust as needed
//                   child: WebView(
//                     initialUrl: 'about:blank',
//                     onWebViewCreated: (WebViewController webViewController) {
//                       _webViewController = webViewController;
//                       _isWebViewReady = true; // Mark web view as ready
//                       _loadHtmlContent(); // Load initial HTML content
//                     },
//                     javascriptMode: JavascriptMode.unrestricted,
//                     onPageFinished: (String url) {
//                       // Load HTML content into the web view
//                       _loadHtmlContent();
//                     },
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'WebView Hint Text',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _loadHtmlContent() {
//     if (!_isWebViewReady || _webViewController == null) {
//       return;
//     }
//     String htmlContent = '''
//       <!DOCTYPE html>
//       <html>
//         <head>
//           <style>${_cssController.text}</style>
//         </head>
//         <body>${_htmlController.text}</body>
//         <script>${_jsController.text}</script>
//       </html>
//     ''';
//     String base64String =
//         base64Encode(const Utf8Encoder().convert(htmlContent));
//     _webViewController?.loadUrl('data:text/html;base64,$base64String');
//   }
// }

// class ResizableWidget extends StatefulWidget {
//   final Widget child;

//   const ResizableWidget({required this.child});

//   @override
//   _ResizableWidgetState createState() => _ResizableWidgetState();
// }

// class _ResizableWidgetState extends State<ResizableWidget> {
//   double _height = 100;
//   double _width = 200;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: _width,
//       height: _height,
//       child: widget.child,
//     );
//   }
// }
