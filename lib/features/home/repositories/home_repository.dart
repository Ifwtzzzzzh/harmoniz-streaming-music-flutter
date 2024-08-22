import 'dart:io';

import 'package:harmoniz/core/constants/server_constant.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<void> uploadSong(File selectedImage, File selectedAudio) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${ServerConstant.serverURL}/song/upload'),
    );

    request
      ..files.addAll([
        await http.MultipartFile.fromPath('song', selectedAudio.path),
        await http.MultipartFile.fromPath('thumbnail', selectedImage.path),
      ])
      ..fields.addAll({
        'artist': 'Pee Wee Gaskin',
        'song_name': 'Fluktuasi Glukosa',
        'hex_code': 'FFFFFF'
      })
      ..headers.addAll({
        'x-auth-token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU0ZWU2MWRkLTcwOGItNGE4Ni1iZWFiLTU3ZmM3ODA3YzI4ZiJ9.UXb-_AGcFq_yUxRsrjTEoFvo7sSdJ6O_G2Xs0H7ktpk'
      });
    final res = await request.send();
    print(res);
  }
}
