
class User {
  int id;
  String name;
  
  
  User({this.id, this.name, });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
    };
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    name = map['name'] as String;
  }

  @override
  String toString() {
    return ('id: ${this.id} - name: ${this.name}');
  }

}