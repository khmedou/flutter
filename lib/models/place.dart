class Placee {
  int? pk;
  String? place;
  int? nbrePlace;
  String? diplomeA;
  String? exprenceA;
  String? comptence1;
  String? comptence2;
  String? comptence3;

  Placee(
      {this.pk,
      this.place,
      this.nbrePlace,
      this.diplomeA,
      this.exprenceA,
      this.comptence1,
      this.comptence2,
      this.comptence3});

  Placee.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    place = json['place'];
    nbrePlace = json['nbre_place'];
    diplomeA = json['diplome_A'];
    exprenceA = json['exprence_A'];
    comptence1 = json['comptence_1'];
    comptence2 = json['comptence_2'];
    comptence3 = json['comptence_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['place'] = this.place;
    data['nbre_place'] = this.nbrePlace;
    data['diplome_A'] = this.diplomeA;
    data['exprence_A'] = this.exprenceA;
    data['comptence_1'] = this.comptence1;
    data['comptence_2'] = this.comptence2;
    data['comptence_3'] = this.comptence3;
    return data;
  }
}
