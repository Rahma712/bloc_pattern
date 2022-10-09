
class Character {
  late int charId;
  late String name;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String statusDeadOrAlive;
  late List<dynamic> appearanceOfSeason;
  late String actorName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSoulAppearance;
   Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    nickName = json['nickname'];
    image = json['img'];
    jobs = json['occupation'];
    statusDeadOrAlive = json['status'];
    appearanceOfSeason = json['appearance'];
    actorName = json['portrayed'];
    categoryForTwoSeries = json['category'];
    betterCallSoulAppearance = json['better_call_saul_appearance'];
  }
}
