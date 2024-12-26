import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

String? imgURL(
  String? text1,
  String? text2,
) {
  // create a FlutterFlow custom function that combines two text inputs and displays the result in a Text widget. Both text inputs will be dynamic
  return '$text1$text2';
}
