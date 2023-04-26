class st {
  int? emp;
  int? conge;
  int? active;
  int? place;

  st({this.emp, this.conge, this.active, this.place});

  st.fromJson(Map<String, dynamic> json) {
    emp = json['Emp'];
    conge = json['conge'];
    active = json['active'];
    place = json['place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Emp'] = this.emp;
    data['conge'] = this.conge;
    data['active'] = this.active;
    data['place'] = this.place;
    return data;
  }
}
