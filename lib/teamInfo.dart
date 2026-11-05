import 'package:flutter/material.dart';

import 'teamProvider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeamInfo extends ConsumerWidget {
  final String eventKey;

  const TeamInfo({super.key, required this.eventKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teams = ref.watch(teamProvider(eventKey));

    return teams.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
      data: (teamList) => Expanded(
        child: ListView.builder(
          itemCount: teamList.length,
          itemBuilder: (context, index) {
            final team = teamList[index];

            return ListTile(
              title: Text(
                '${team['team_number']} - '
                '${team['nickname'] ?? 'Unknown'}',
              ),
              subtitle: Text(
                '${team['city'] ?? 'Unknown'}, '
                '${team['state_prov'] ?? ''}',
              ),
            );
          },
        ),
      ),
    );
  }
}
