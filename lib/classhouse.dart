import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

const tbaApiKey = String.fromEnvironment('TBA_API_KEY');
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

class Scoring extends StatelessWidget {
  final String level;
  final double x;
  final int score;
  final ValueChanged<int> onScoreChanged;

  const Scoring({
    super.key,
    required this.level,
    required this.x,
    required this.score,
    required this.onScoreChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 50),
        Column(
          children: [
            SizedBox(width: x, child: Text('     $level')),
            Row(
              children: [
                IconButton(
                  onPressed: () => onScoreChanged(score + 1),
                  icon: const Icon(Icons.plus_one),
                ),
                IconButton(
                  onPressed: () => onScoreChanged(score - 1),
                  icon: const Icon(Icons.exposure_minus_1),
                ),
              ],
            ),
            Text('$score', textAlign: TextAlign.left),
          ],
        ),
        const SizedBox(width: 75),
      ],
    );
  }
}

class Reefscape extends StatefulWidget {
  const Reefscape({super.key});
  @override
  State<StatefulWidget> createState() {
    return ReefscapeStateful();
  }
}

class ReefscapeStateful extends State<Reefscape> {
  String realTimeInput = '';
  String otherRealTimeInput = '';
  List<Map<String, dynamic>> savedMatches = [];
  final TextEditingController teamController = TextEditingController();

  final TextEditingController matchController = TextEditingController();
  int? selectedMatchIndex;
  int l1Score = 0;
  int l2Score = 0;
  int l3Score = 0;
  int l4Score = 0;
  int algaeProcessorScore = 0;
  int algaeBargeScore = 0;
  void loadMatch(int index) {
    final record = savedMatches[index];

    setState(() {
      selectedMatchIndex = index;

      realTimeInput = record['teamNumber'];
      otherRealTimeInput = record['matchNumber'];

      l1Score = record['L1'];
      l2Score = record['L2'];
      l3Score = record['L3'];
      l4Score = record['L4'];

      algaeProcessorScore = record['algaeProcessor'];
      algaeBargeScore = record['algaeBarge'];

      teamController.text = realTimeInput;
      matchController.text = otherRealTimeInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (savedMatches.isNotEmpty)
              DropdownButton<int>(
                value: selectedMatchIndex,
                hint: const Text('Select a saved match'),
                items: List.generate(savedMatches.length, (index) {
                  final record = savedMatches[index];

                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(
                      'Team ${record['teamNumber']} - '
                      'Match ${record['matchNumber']}',
                    ),
                  );
                }),
                onChanged: (index) {
                  if (index != null) {
                    loadMatch(index);
                  }
                },
              ),
            SizedBox(
              width: 800,
              height: 80,
              child: TextField(
                onChanged: (number) {
                  setState(() {
                    // Updates the variable automatically on every single keystroke
                    realTimeInput = number;
                  });
                },
                controller: teamController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Team number',
                ),
              ),
            ),
            SizedBox(
              width: 800,
              height: 80,
              child: TextField(
                onChanged: (Number) {
                  setState(() {
                    // Updates the variable automatically on every single keystroke
                    otherRealTimeInput = Number;
                  });
                },
                controller: matchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Match number',
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Scoring(
                      level: 'L1',
                      x: 50,
                      score: l1Score,
                      onScoreChanged: (value) {
                        setState(() {
                          l1Score = value;
                        });
                      },
                    ),
                    Scoring(
                      level: 'L2',
                      x: 50,
                      score: l2Score,
                      onScoreChanged: (value) {
                        setState(() {
                          l2Score = value;
                        });
                      },
                    ),
                    Scoring(
                      level: 'L3',
                      x: 50,
                      score: l3Score,
                      onScoreChanged: (value) {
                        setState(() {
                          l3Score = value;
                        });
                      },
                    ),
                    Scoring(
                      level: 'L4',
                      x: 50,
                      score: l4Score,
                      onScoreChanged: (value) {
                        setState(() {
                          l4Score = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 80),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Scoring(
                  level: '      Algae in Processor',
                  x: 200,
                  score: algaeProcessorScore,
                  onScoreChanged: (value) {
                    setState(() {
                      algaeProcessorScore = value;
                    });
                  },
                ),
                Scoring(
                  level: '        Algae in Barge',
                  x: 200,
                  score: algaeBargeScore,
                  onScoreChanged: (value) {
                    setState(() {
                      algaeBargeScore = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedMatchIndex = null;

                      realTimeInput = '';
                      otherRealTimeInput = '';

                      l1Score = 0;
                      l2Score = 0;
                      l3Score = 0;
                      l4Score = 0;

                      algaeProcessorScore = 0;
                      algaeBargeScore = 0;

                      teamController.clear();
                      matchController.clear();
                    });
                  },
                  child: const Text('New Match'),
                ),
                FilledButton(
                  onPressed: () => setState(() {
                    final Map<String, dynamic> record = {
                      'teamNumber': realTimeInput,
                      'matchNumber': otherRealTimeInput,
                      'L1': l1Score,
                      'L2': l2Score,
                      'L3': l3Score,
                      'L4': l4Score,
                      'algaeProcessor': algaeProcessorScore,
                      'algaeBarge': algaeBargeScore,
                    };

                    setState(() {
                      if (selectedMatchIndex == null) {
                        savedMatches.add(record);
                        selectedMatchIndex = savedMatches.length - 1;
                      } else {
                        savedMatches[selectedMatchIndex!] = record;
                      }
                    });
                  }),
                  child: Text('Save data'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    teamController.dispose();
    matchController.dispose();
    super.dispose();
  }
}
