import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instagram_login/instagram_constant.dart';

class InstagramModel {
  List<String> userFields = ['id', 'username'];

  String? authorizationCode;
  String? accessToken;
  String? userID;
  String? username;
  String? mediaType;
  String? mediaUrl;

  void getAuthorizationCode(String url) {
    authorizationCode = url
        .replaceAll('${InstagramConstant.redirectUri}?code=', '')
        .replaceAll('#_', '');
  }

  Future<bool> getTokenAndUserID() async {
    var url = Uri.parse('https://api.instagram.com/oauth/access_token');
    final response = await http.post(url, body: {
      'client_id': InstagramConstant.clientID,
      'redirect_uri': InstagramConstant.redirectUri,
      'client_secret': InstagramConstant.appSecret,
      'code': authorizationCode,
      'grant_type': 'authorization_code'
    });
    accessToken = json.decode(response.body)['access_token'];
    print(accessToken);
    userID = json.decode(response.body)['user_id'].toString();
    return (accessToken != null && userID != null) ? true : false;
  }

//https://graph.instagram.com/me/media
  Future<bool> getUserProfile() async {
    final fields = userFields.join(',');
    final responseNode = await http.get(Uri.parse(
        'https://graph.instagram.com/$userID?fields=$fields&access_token=$accessToken'));
    var instaProfile = {
      'id': json.decode(responseNode.body)['id'].toString(),
      'username': json.decode(responseNode.body)['username']
    };
    username = json.decode(responseNode.body)['username'];

    print('username: $username');
    print(instaProfile);
    return instaProfile != null ? true : false;
  }
}
//https://graph.instagram.com/4947545018642729/media&access_token=IGQVJYWDdhRktteFFNdlFKQkhYdzF2eXV4b0tNYXB4NnJiQTI3VUllaGJERDVmY2padmJHNWxZAd0dmMVNzbTRVR2tMa0EyWFlGV1ItUFVPSGx2REVPUGNkNWRITVN5aWZAJMktwcEhzaVJJc1NMcE5MM3BNTzFFRnRISXFJ