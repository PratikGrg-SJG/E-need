import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../enums/enums.dart';

console(var data) {
  if (kDebugMode) {
    return print("\x1B[33m$data\x1B[0m");
    // return print(data);
  }
}

consolelog(var data) {
  if (kDebugMode) {
    return log(data.toString());
  }
}

logger(var message, {LoggerType loggerType = LoggerType.info}) {
  if (kDebugMode) {
    var logger = Logger(
      printer: PrettyPrinter(
          colors: true, // Colorful log messages
          printEmojis: true, // Print an emoji for each log message
          printTime: true // Should each log print contain a timestamp
          ),
    );
    switch (loggerType) {
      case LoggerType.success:
        logger.i("$message");
        break;
      case LoggerType.debug:
        logger.d(message);
        break;
      case LoggerType.error:
        logger.e(message);
        break;
      case LoggerType.info:
        logger.i(message);
        break;
      case LoggerType.warning:
        logger.w(message);
        break;
      case LoggerType.verbose:
        logger.v(message);
        break;
      default:
        logger.e(message);
    }
  }
}
