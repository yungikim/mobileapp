import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mobileapp/utils/sample/kakao_login/social_login.dart';

class KakaoLogin implements SocialLogin{

  @override
  Future<bool> login() async{
    try{
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled){
        try{
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        }catch(e){
          return false;
        }
      }else{
        try{
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        }catch(e){
          return false;
        }
      }
    }catch(e){
      return false;
    }
  }

  @override
  Future<bool> logout() async{
    try{
      return true;
      await UserApi.instance.unlink();
    }catch(error){
      return false;
    }
  }
}