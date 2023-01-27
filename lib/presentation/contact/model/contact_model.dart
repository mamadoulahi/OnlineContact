class ContactModel{
  String? id;
  String? name;
  String? surname;
  String? email;
  String? telephone;

  ContactModel({this.id,this.name, this.surname, this.email, this.telephone});
  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "nom":name,
      "prenom": surname,
      "email":email,
      "numero":telephone
    };
  }
  factory ContactModel.fromJson(Map<String,dynamic> json){
    return ContactModel(
        id:json["id"],
        name:json["nom"],
        surname:json["prenom"],
        email:json["email"],
        telephone:json["numero"]
    );
  }
}