import 'dart:convert';

TablePremiere tablePremiereFromJson(String str) =>
    TablePremiere.fromJson(json.decode(str));

String tablePremiereToJson(TablePremiere data) => json.encode(data.toJson());

class TablePremiere {
  List<TableData> table;

  TablePremiere({
    required this.table,
  });

  factory TablePremiere.fromJson(Map<String, dynamic> json) => TablePremiere(
        table:
            List<TableData>.from(json["table"].map((x) => TableData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "table": List<dynamic>.from(table.map((x) => x.toJson())),
      };
}

class TableData {
  String idStanding;
  String intRank;
  String idTeam;
  String strTeam;
  String strBadge;
  String idLeague;
  String strLeague;
  String strSeason;
  String strForm;
  String strDescription;
  String intPlayed;
  String intWin;
  String intLoss;
  String intDraw;
  String intGoalsFor;
  String intGoalsAgainst;
  String intGoalDifference;
  String intPoints;
  DateTime dateUpdated;

  TableData({
    required this.idStanding,
    required this.intRank,
    required this.idTeam,
    required this.strTeam,
    required this.strBadge,
    required this.idLeague,
    required this.strLeague,
    required this.strSeason,
    required this.strForm,
    required this.strDescription,
    required this.intPlayed,
    required this.intWin,
    required this.intLoss,
    required this.intDraw,
    required this.intGoalsFor,
    required this.intGoalsAgainst,
    required this.intGoalDifference,
    required this.intPoints,
    required this.dateUpdated,
  });

  factory TableData.fromJson(Map<String, dynamic> json) => TableData(
        idStanding: json["idStanding"] ?? "",
        intRank: json["intRank"] ?? "",
        idTeam: json["idTeam"] ?? "",
        strTeam: json["strTeam"] ?? "",
        strBadge: json["strBadge"] ?? "",
        idLeague: json["idLeague"] ?? "",
        strLeague: json["strLeague"] ?? "",
        strSeason: json["strSeason"] ?? "",
        strForm: json["strForm"] ?? "",
        strDescription: json["strDescription"] ?? "",
        intPlayed: json["intPlayed"] ?? "",
        intWin: json["intWin"] ?? "",
        intLoss: json["intLoss"] ?? "",
        intDraw: json["intDraw"] ?? "",
        intGoalsFor: json["intGoalsFor"] ?? "",
        intGoalsAgainst: json["intGoalsAgainst"] ?? "",
        intGoalDifference: json["intGoalDifference"] ?? "",
        intPoints: json["intPoints"] ?? "",
        dateUpdated: DateTime.tryParse(json["dateUpdated"] ?? "") ?? DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "idStanding": idStanding,
        "intRank": intRank,
        "idTeam": idTeam,
        "strTeam": strTeam,
        "strBadge": strBadge,
        "idLeague": idLeague,
        "strLeague": strLeague,
        "strSeason": strSeason,
        "strForm": strForm,
        "strDescription": strDescription,
        "intPlayed": intPlayed,
        "intWin": intWin,
        "intLoss": intLoss,
        "intDraw": intDraw,
        "intGoalsFor": intGoalsFor,
        "intGoalsAgainst": intGoalsAgainst,
        "intGoalDifference": intGoalDifference,
        "intPoints": intPoints,
        "dateUpdated": dateUpdated.toIso8601String(),
      };
}
