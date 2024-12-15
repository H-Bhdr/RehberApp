import 'package:flutter/material.dart';

class ResponsiveHelper {
  final BuildContext context;

  ResponsiveHelper(this.context);

  // Ekran genişliğini alır
  double get screenWidth => MediaQuery.of(context).size.width;

  // Ekran yüksekliğini alır
  double get screenHeight => MediaQuery.of(context).size.height;

  // Geniş ekran kontrolü
  bool get isLargeScreen => screenWidth > 700;

  // Orta boy ekran kontrolü
  bool get isMediumScreen => screenWidth > 400 && screenWidth <= 600;

  // Küçük ekran kontrolü
  bool get isSmallScreen => screenWidth <= 400;

  // Dinamik olarak boyutlandırılmış genişlik
  double dynamicWidth(double ratio) {
    return screenWidth * ratio;
  }

  // Dinamik olarak boyutlandırılmış yükseklik
  double dynamicHeight(double ratio) {
    return screenHeight * ratio;
  }

  // Ekran oranını alır
  double get screenAspectRatio => screenWidth / screenHeight;

  // Responsive font boyutu
  double get responsiveTextSize {
    if (isLargeScreen) {
      return 24.0;
    } else if (isMediumScreen) {
      return 20.0;
    } else {
      return 16.0;
    }
  }

  // Responsive app bar height
  double get responsiveAppBarHeight {
    if (isLargeScreen) {
      return 66.0;
    } else if (isMediumScreen) {
      return 58.0;
    } else {
      return 40.0;
    }
  }

    // Responsive app bar height
  double get homeSliderHeight {
    if (isLargeScreen) {
      return 300.0;
    } else if (isMediumScreen) {
      return 250.0;
    } else {
      return 230.0;
    }
  }



    double get homeSliderContainerHeight {
    if (isLargeScreen) {
      return 405.0;
    } else if (isMediumScreen) {
      return 355.0;
    } else {
      return 310.0;
    }
  }



  
    double get homeSliderPicWidth {
    if (isLargeScreen) {
      return 405.0; 
    } else if (isMediumScreen) {
      return 200;
    } else {
      return 169;
    }
  }



}



// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:archive/archive.dart';

// class GetImageService {
//   final String baseUrl;

//   GetImageService(this.baseUrl);

//   /// API'den görüntü detaylarını alır ve resmi döner
//   Future<Image?> fetchImageDetails(String folderName, String fileName) async {
//     final url = Uri.parse('https://envantyservices.com.tr/api/FtpImageControllerV2/GetImageAsBinary/$folderName/$fileName');

//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         final String base64ImageData = jsonData['data']; // Sıkıştırılmış base64 verisi

//         // Base64'ten çözme
//         final compressedBytes = base64Decode(base64ImageData);

//         // Veriyi GZIP formatından çıkarma
//         final archive = GZipDecoder().decodeBytes(compressedBytes);

//         // Çözülmüş veriyi bir resim olarak yükleme
//         return Image.memory(Uint8List.fromList(archive));
//       } else {
//         print('API Hatası: ${response.statusCode}, ${response.body}');
//         return null;
//       }
//     } catch (e) {
//       print('İstek sırasında hata oluştu: $e');
//       return null;
//     }
//   }
// }

// class Notificationspage extends StatefulWidget {
//   @override
//   _NotificationspageState createState() => _NotificationspageState();
// }

// class _NotificationspageState extends State<Notificationspage> {
//   late Future<List<Image?>> _images;

//   @override
//   void initState() {
//     super.initState();
//     // Birden fazla resim almak için URL'leri burada güncelliyoruz.
//     _images = Future.wait([
//       GetImageService('https://envantyservices.com.tr/api/FtpImage')
//           .fetchImageDetails('ceo', 'b5c1564c-310d-45b3-af4a-8c2c58323d16.jpeg'),

//     ]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Resim Görüntüle")),
//       body: ListView(
//         children: [
//           FutureBuilder<List<Image?>>(
//             future: _images,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text("Bir hata oluştu: ${snapshot.error}"));
//               } else if (snapshot.hasData) {
//                 final images = snapshot.data!;
//                 return Column(
//                   children: List.generate(images.length, (index) {
//                     return Column(
//                       children: [
//                         images[index] ?? Container(), // Resim
              
//                         Divider() // Resimler arası çizgi
//                       ],
//                     );
//                   }),
//                 );
//               } else {
//                 return Center(child: Text("Resimler yüklenemedi."));
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }

// }