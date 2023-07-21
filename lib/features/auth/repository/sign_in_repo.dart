import 'dart:convert';
import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_sync/core/utils/api_client.dart';
import 'package:todo_with_sync/core/utils/app_error.dart';
import 'package:todo_with_sync/core/utils/urls.dart';

class LoginRepository {
  Future<Either<AppError, String>> login(
    Map<String, String> body,
  ) async {
    BotToast.showLoading();
    try {
      final response = await ApiClient().postRequest(Urls.loginUrl, body);
      final decodedJson = json.decode(response.body);
      log(response.body);
      if (response.statusCode == 200) {
        BotToast.closeAllLoading();
        BotToast.showText(
          text: 'Sign In Successfully!',
          contentColor: Colors.green,
        );
        log(decodedJson['accessToken']);
        return Right(decodedJson['accessToken']);
      } else {
        BotToast.showText(
          text: 'Something wrong!, try again.',
          contentColor: Colors.red,
        );
        BotToast.closeAllLoading();
        return const Left(AppError.httpError);
      }
    } catch (c) {
      log('');
      BotToast.closeAllLoading();
      return const Left(AppError.networkError);
    }
  }
}
