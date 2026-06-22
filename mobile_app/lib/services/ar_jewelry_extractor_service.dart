import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ArJewelryExtractorService {
  static Future<String?> extractOverlay(String imageUrl, String category) async {
    try {
      if (imageUrl.startsWith('http://localhost') || imageUrl.startsWith('http://127.0.0.1')) {
        return null;
      }
      if (!imageUrl.startsWith('https://')) {
        return null;
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.remove.bg/v1.0/removebg'),
      );
      
      request.headers['X-Api-Key'] = 'SUWFLLticifjwPLhjva7b2Re';
      request.fields['image_url'] = imageUrl;
      request.fields['size'] = 'auto';
      request.fields['format'] = 'png';

      var response = await request.send();

      if (response.statusCode == 200) {
        Uint8List responseData = await response.stream.toBytes();
        String base64String = base64Encode(responseData);
        return 'data:image/png;base64,$base64String';
      } else {
        debugPrint('ArJewelryExtractorService Error: HTTP ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('ArJewelryExtractorService error: $e');
      return null;
    }
  }
}
