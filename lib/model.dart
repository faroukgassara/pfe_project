class Posts {
  final String nom;
  final String prenom;
  final String sex;
  final int statusmatriomo_id;

  Posts({this.nom, this.prenom,this.sex,this.statusmatriomo_id});

  factory Posts.formJson(Map <String, dynamic> json){
    return new Posts(
       nom: json['nom'],
       prenom: json['prenom'],
       sex: json['sex'],
       statusmatriomo_id: json['statusmatriomo_id'],
    );
  }
}