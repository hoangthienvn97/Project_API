
class Data{
  final String type;
  final String id;
  final int time;
  final List<Phone> phones;
  final List<Username> usernames;
  final String name;
  final String pass;
  final List<Email> emails;
  final bool isDeleted;
  final int timePassChange;
  final String role_system;
  // final List<Company> companies;
  final String createdAt;
  final String updateAt;


  Data.fromJson(Map<String, dynamic> json):
  type = json['type'],
  id = json['_id'],
  time = json['time'],
  phones = _convertToListPhone(json['phones']),
  usernames = _convertUsername(json['usernames']),
  name = json['name'],
  pass = json['pass'],
  emails = _convertEmail(json['emails']),
  isDeleted = json['isDeleted'],
  timePassChange = json['timePassChange'],
  role_system = json['role_system'],
  // companies = json['companies'],
  createdAt = json['createdAt'],
  updateAt = json['updateAt'];

  Map<String, dynamic> toJson() =>{
    'type':type,
    '_id':id,
    'time':time,
    'phones':_phonesToJson(),
    'username':_userNameToJson(),
    'name':name,
    'pass':pass,
    'emails':_emailToJson(),
    'isDeleted':isDeleted,
    'timePassChange':timePassChange,
    'role_system':role_system,
    // 'companies':companies, thi
    'createdAt':createdAt,
    'updateAt':updateAt,
  };

  Map<String, dynamic> _phonesToJson(){

    List<dynamic> t = List();
    
    this.phones.forEach((e){
      t.add(e.toJson());
    });

    return {
      'phones':t
    };
  }

  Map<String, dynamic> _emailToJson(){
    List<dynamic> el = List();
    this.emails.forEach((e){
      el.add(e.toJson());
    });
    return {
      'emails':el
    };
  }

  Map<String, dynamic> _userNameToJson(){
    List<dynamic> us = List();
    this.usernames.forEach((e){
      us.add(e.toJson());
    });
    return {
      'usernames':us
    };
  }

  static List<Phone> _convertToListPhone(List<dynamic> json){
    List<Phone> t = List();
    json.forEach((e){
      t.add(Phone.fromJson(e));
    }); 
    return t;
  }

  static List<Email> _convertEmail(List<dynamic> json){
    List<Email> el = List();
    json.forEach((e){
      el.add(Email.fromJson(e));
    });
    return el;
  }

  static List<Username> _convertUsername(List<dynamic> json){
    List<Username> user = List();
    json.forEach((e){
      user.add(Username.fromJson(e));
    });
    return user;
  }

}

class Phone{
  final String id;
  final String phone;
  final bool isValidated;

  Phone.fromJson(Map<String, dynamic> json):
  id = json['_id'],
  phone = json['phone'],
  isValidated = json['isValidated'];

  Map<String, dynamic> toJson() =>{
    '_id':id,
    'username':phone,
    'isValidated':isValidated
  };

}

class Username{
  final String id;
  final String username;
  final bool isValidated;

  Username.fromJson(Map<String, dynamic> json):
  id = json['_id'],
  username = json['username'],
  isValidated = json['isValidated'];

  Map<String, dynamic> toJson() =>{
    '_id':id,
    'username':username,
    'isValidated':isValidated
  };

}

class Email{
  final String id;
  final String email;
  final bool isValidated;

  Email.fromJson(Map<String, dynamic> json):
  id = json['_id'],
  email = json['email'],
  isValidated = json['isValidated'];

  Map<String, dynamic> toJson() =>{
    '_id':id,
    'username':email,
    'isValidated':isValidated
  };
}

class Company{}