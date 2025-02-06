class MatchModel {
  final int matchId;
  final String gameDate;
  final String hightlightThumbnail;
  final String gameWeek;
  final MatchMomentum matchMomentum;
  final Teams teams;
  final Player playerOfTheMatch;
  final String score;
  final List<Event> events;

  MatchModel({
    required this.hightlightThumbnail,
    required this.matchId,
    required this.matchMomentum,
    required this.teams,
    required this.playerOfTheMatch,
    required this.score,
    required this.events,
    required this.gameDate,
    required this.gameWeek,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      hightlightThumbnail: json["hightlightThumbnail"],
      gameDate: json["gameDate"],
      gameWeek: json["gameWeek"],
      matchId: json['matchId'],
      matchMomentum: MatchMomentum.fromJson(json['matchMomentum']),
      teams: Teams.fromJson(json['teams']),
      playerOfTheMatch: Player.fromJson(json['playerOfTheMatch']),
      score: json['score'],
      events: (json['events'] as List).map((e) => Event.fromJson(e)).toList(),
    );
  }
}

// MatchMomentum Model
class MatchMomentum {
  final BallPossession ballPossession;
  final TeamsLogos teams;
  final List<MomentumData> momentumData;
  final List<MomentumEvent> events;
  final int currentMinute;
  final Background background;

  MatchMomentum({
    required this.ballPossession,
    required this.teams,
    required this.momentumData,
    required this.events,
    required this.currentMinute,
    required this.background,
  });

  factory MatchMomentum.fromJson(Map<String, dynamic> json) {
    return MatchMomentum(
      ballPossession: BallPossession.fromJson(json['ballPossession']),
      teams: TeamsLogos.fromJson(json['teams']),
      momentumData: (json['momentumData'] as List)
          .map((e) => MomentumData.fromJson(e))
          .toList(),
      events: (json['events'] as List)
          .map((e) => MomentumEvent.fromJson(e))
          .toList(),
      currentMinute: json['currentMinute'],
      background: Background.fromJson(json['background']),
    );
  }
}

// Ball Possession Model
class BallPossession {
  final int team1;
  final int team2;

  BallPossession({required this.team1, required this.team2});

  factory BallPossession.fromJson(Map<String, dynamic> json) {
    return BallPossession(
      team1: json['team1'],
      team2: json['team2'],
    );
  }
}

// Teams Logos Model
class TeamsLogos {
  final String team1Logo;
  final String team2Logo;

  TeamsLogos({required this.team1Logo, required this.team2Logo});

  factory TeamsLogos.fromJson(Map<String, dynamic> json) {
    return TeamsLogos(
      team1Logo: json['team1Logo'],
      team2Logo: json['team2Logo'],
    );
  }
}

// Momentum Data Model
class MomentumData {
  final int minute;
  final int value;

  MomentumData({required this.minute, required this.value});

  factory MomentumData.fromJson(Map<String, dynamic> json) {
    return MomentumData(
      minute: json['minute'],
      value: json['value'],
    );
  }
}

// Momentum Event Model
class MomentumEvent {
  final int minute;
  final String type;
  final int team;
  final String icon;

  MomentumEvent({
    required this.minute,
    required this.type,
    required this.team,
    required this.icon,
  });

  factory MomentumEvent.fromJson(Map<String, dynamic> json) {
    return MomentumEvent(
      minute: json['minute'],
      type: json['type'],
      team: json['team'],
      icon: json['icon'],
    );
  }
}

// Background Model
class Background {
  final String positiveColor;
  final String negativeColor;

  Background({required this.positiveColor, required this.negativeColor});

  factory Background.fromJson(Map<String, dynamic> json) {
    return Background(
      positiveColor: json['positiveColor'],
      negativeColor: json['negativeColor'],
    );
  }
}

// Teams Model
class Teams {
  final Team home;
  final Team away;

  Teams({required this.home, required this.away});

  factory Teams.fromJson(Map<String, dynamic> json) {
    return Teams(
      home: Team.fromJson(json['home']),
      away: Team.fromJson(json['away']),
    );
  }
}

// Team Model
class Team {
  final String name;
  final String logo;

  Team({required this.name, required this.logo});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name'],
      logo: json['logo'],
    );
  }
}

// Player of the Match Model
class Player {
  final String name;
  final String image;
  final String club;
  final String clubLogo;

  Player({
    required this.name,
    required this.image,
    required this.club,
    required this.clubLogo,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      image: json['image'],
      club: json['club'],
      clubLogo: json['clubLogo'],
    );
  }
}

// Event Model
class Event {
  final int? minute;
  final String type;
  final String? player;
  final String? playerImage;
  final String? team;
  final String? assist;
  final String? outcome;
  final String? playerIn;
  final String? playerOut;
  final List<PenaltyDetail>? details;

  Event({
    this.minute,
    required this.type,
    this.player,
    this.playerImage,
    this.team,
    this.assist,
    this.outcome,
    this.playerIn,
    this.playerOut,
    this.details,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      minute: json['minute'] is int ? json['minute'] : null,
      type: json['type'],
      player: json['player'],
      playerImage: json['playerImage'],
      team: json['team'],
      assist: json['assist'],
      outcome: json['outcome'],
      playerIn: json['playerIn'],
      playerOut: json['playerOut'],
      details: json['details'] != null
          ? (json['details'] as List)
              .map((e) => PenaltyDetail.fromJson(e))
              .toList()
          : null,
    );
  }
}

// Penalty Detail Model
class PenaltyDetail {
  final String player;
  final String team;
  final String outcome;
  final String playerImage;

  PenaltyDetail({
    required this.player,
    required this.team,
    required this.outcome,
    required this.playerImage,
  });

  factory PenaltyDetail.fromJson(Map<String, dynamic> json) {
    return PenaltyDetail(
      player: json['player'],
      team: json['team'],
      outcome: json['outcome'],
      playerImage: json['playerImage'],
    );
  }
}
