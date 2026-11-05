import 'dart:convert';

import 'itsAllComingTogether.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final teamProvider = FutureProvider.autoDispose
    .family<List<Map<String, dynamic>>, String>((ref, eventKey) async {
      final response = await http.get(
        Uri.parse(
          'https://www.thebluealliance.com/api/v3/event/$eventKey/teams',
        ),
        headers: {'X-TBA-Auth-key': tbaApiKey},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load teams for event $eventKey');
      }

      final List<dynamic> jsonList = jsonDecode(response.body);

      return jsonList.cast<Map<String, dynamic>>();
    });
