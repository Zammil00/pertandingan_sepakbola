import 'package:flutter/material.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/screens/match_details.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/screens/matches.dart';

class Matches extends StatelessWidget {
  const Matches({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        if (settings.name == '/match-details') {
          final matchId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => MatchDetails(matchId: matchId),
          );
        }

        return MaterialPageRoute(
          builder: (_) => const MatchesScreen(),
        );
      },
    );
  }
}
