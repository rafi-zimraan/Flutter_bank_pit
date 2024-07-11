import 'dart:convert';

import 'package:bank_pit_bwa/models/data_plan_form_model.dart';
import 'package:bank_pit_bwa/models/topup_form_model.dart';
import 'package:bank_pit_bwa/models/tranfer_form_model.dart';
import 'package:bank_pit_bwa/services/auth_service.dart';
import 'package:bank_pit_bwa/shared/shared_value.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> topUp(TopupFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/top_ups',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> transfer(TranferFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/tranfers',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> dataPlan(DataPlanFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/data_plans',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
