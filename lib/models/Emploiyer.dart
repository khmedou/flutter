class Employee {
  int? pk;
  String? nom;
  dynamic? photo;
  String? adresse;
  String? numTel;
  String? email;
  String? poste;
  String? numCompte;
  String? dataNaissance;
  int? salaire;
bool? statut;
  Employee(
      {this.pk,
      this.statut,
      this.nom,
      this.photo,
      this.adresse,
      this.numTel,
      this.email,
      this.poste,
      this.numCompte,
      this.dataNaissance,
      this.salaire});

  Employee.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    statut = json['statut'];
    nom = json['nom'];
    photo = json['photo'];
    adresse = json['adresse'];
    numTel = json['num_tel'];
    email = json['Email'];
    poste = json['poste'];
    numCompte = json['num_compte'];
    dataNaissance = json['data_naissance'];
    salaire = json['salaire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['nom'] = this.nom;
     data['statu'] = this.statut;
    data['photo'] = this.photo;
    data['adresse'] = this.adresse;
    data['num_tel'] = this.numTel;
    data['Email'] = this.email;
    data['poste'] = this.poste;
    data['num_compte'] = this.numCompte;
    data['data_naissance'] = this.dataNaissance;
    data['salaire'] = this.salaire;
    return data;
  }
}
