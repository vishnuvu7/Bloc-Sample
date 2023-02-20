import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

String getTranslateValue(String value){
  try {
    return tr(value);
  } catch (e) {
    if (kDebugMode) {
      print("Translate error :$e");
    }
    return value;
  }
}
