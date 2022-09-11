class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? company;
  final String? role;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.company,
    this.role,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'company': company,
        'role': role,
      };

  static UserModel fromJson(Map<String, dynamic> data) => UserModel(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        company: data['company'],
        role: data['role'],
      );

  /*factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
      name: data?['name'],
      email: data?['email'],
      age: data?['age'],
      gender: data?['gender'],
    );
  }
   Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (age != null) "age": age,
      if (gender != null) "gender": gender,
    };
  }
  */

}
