import 'package:flutter/material.dart';

import '../data/backend/api_base.dart/api_exeption.dart';

extension ExceptionMapper on Exception {
  static String mapExceptionToMessage(Object e, StackTrace stackTrace) {
    debugPrint('${e.runtimeType}: $e $stackTrace');
    if (e is ApiException && e.cause == ApiExceptionCause.noConnection) {
      return 'Bitte überprüfen Sie Ihre Internetverbindung und versuchen Sie es erneut.';
    }
    return 'Etwas ist schief gelaufen!';
  }
}
