import 'dart:convert';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:dirm_vfd/objects/_.dart';
import 'package:dirm_vfd/objects/full_receipt.dart';
import 'package:dirm_vfd/objects/receipt.dart';
import 'package:dirm_vfd/objects/z_report.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/validate_cutomer_id.dart';
import 'package:dirm_vfd/utils/validate_email.dart';
import 'package:dirm_vfd/utils/validate_name.dart';
import 'package:dirm_vfd/utils/validate_password.dart';
import 'package:dirm_vfd/utils/validate_phone.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
part '_.g.dart';
part '_.freezed.dart';
part 'login/provider.dart';
part 'login/state.dart';
part 'sign_up/provider.dart';
part 'sign_up/state.dart';
part 'user.dart';
part 'new_receipt/state.dart';
part 'new_receipt/provider.dart';
part 'items/provider.dart';
part 'items/state.dart';
part 'customers/state.dart';
part 'customers/provider.dart';
part 'receipts.dart';
part 'printer/provider.dart';
part 'printer/state.dart';
part 'my_receipts.dart';
part 'z_reports.dart';
part 'resend_email_verification.dart';
part 'delete_account.dart';
part 'search_receipts.dart';
part 'receipt.dart';

Future<http.Response> _post(
    {required String endpoint,
    required Map<String, dynamic> body,
    String? token}) async {
  return await http
      .post(_url(endpoint: endpoint), body: jsonEncode(body), headers: {
    if (token != null) 'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
  });
}

Uri _url({required String endpoint}) =>
    Uri.parse('https://testapp.africaner.online/mobile_apps/v1/$endpoint');

({
  Map<String, dynamic> body,
  int statusCode,
  int bodyStatusCode,
  String? statusDesc,
  dynamic data,
}) _response(http.Response response) {
  if (kDebugMode) {
    print('START RESPONSE\n\n');
    print(response.statusCode);
    print(response.body);
    print('\n\nEND RESPONSE');
  }
  if (response.statusCode == 500) {
    throw 'Internal server error' '\nPlease contact us for more help';
  }
  try {
    final body = jsonDecode(response.body);
    final statusCode = response.statusCode;
    final bodyStatusCode = body['status'];
    final statusDesc = body['statusDesc'];
    return (
      body: body,
      statusCode: statusCode,
      bodyStatusCode: bodyStatusCode,
      statusDesc: statusDesc,
      data: body['data']
    );
  } catch (error) {
    if (kDebugMode) rethrow;
    throw 'Unexpected error occurred';
  }
}
