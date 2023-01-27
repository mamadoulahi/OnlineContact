class UserModel{
  String? id;
  String? nom;
  String? email;

  UserModel({this.id, this.nom, this.email});
  Map<String,dynamic> tojson(){
    return {
      "id":id,
      "email":email,
      "nom":nom
    };
  }

 factory UserModel.fromJson(Map<String,dynamic> json) {

    return UserModel(id:json["id"], nom:json["nom"], email:json["email"]);

  }
}