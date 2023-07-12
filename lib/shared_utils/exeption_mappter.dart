import 'package:flutter/material.dart';

import '../data/backend/api_base.dart/api_exeption.dart';

extension ExceptionMapper on Exception {
  static String mapExceptionToMessage(Object e, StackTrace stackTrace) {
    debugPrint('${e.runtimeType}: $e $stackTrace');
    if (e is ApiException && e.cause == ApiExceptionCause.noConnection) {
      return 'Bitte überprüfen Sie Ihre Internetverbindung und versuchen Sie es erneut.';
    }

    if (e is ApiException && e.cause == ApiExceptionCause.notFound) {
      return 'Ups! Dein Name scheint so selten zu sein, dass er sich lieber außerhalb unserer Datenbank versteckt.';
    }
    return 'Etwas ist schief gelaufen!';
  }
}
