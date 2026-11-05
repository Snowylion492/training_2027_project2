import 'package:flutter/material.dart';
import 'teamProvider.dart';
import 'scoring.dart';
import 'reefscape.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
const tbaApiKey = String.fromEnvironment('TBA_API_KEY');

class ReefscapeStateful extends ConsumerState<Reefscape> {
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
              child: ref
                  .watch(teamProvider('2026cmptx'))
                  .when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stack) => Text('Error: $error'),
                    data: (teamList) {
                      return DropdownButtonFormField<String>(
                        value: realTimeInput.isEmpty ? null : realTimeInput,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Select a team',
                        ),
                        items: teamList.map((team) {
                          final number = team['team_number'].toString();
                          final nickname = team['nickname'] ?? 'Unknown';

                          return DropdownMenuItem<String>(
                            value: number,
                            child: Text('$number - $nickname'),
                          );
                        }).toList(),
                        onChanged: (number) {
                          if (number == null) return;

                          setState(() {
                            realTimeInput = number;
                            teamController.text = number;
                            selectedMatchIndex = null;
                          });
                        },
                      );
                    },
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
