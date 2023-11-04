class UserModel {
  String? userId;
  String? fullName;
  String? age;
  String? company;
  String? city;
  String? email;
  String? password;

  UserModel(
      {this.userId,this.fullName,
      this.age,
      this.company,
      this.city,
      this.email,
      this.password});

  UserModel.fromJson(Map<String, Object?> json)
      : this(
          userId: json['userId'] as String,
          fullName: json['fullName'] as String,
          company: json['company'] as String,
          age: json['age'] as String,
          city: json['city'] as String,
          email: json['email'] as String,
          password: json['password'] as String,
        );

  Map<String, Object?> toJson() {
    return {
      'userId': userId,
      'fullName': fullName,
      'company': company,
      'age': age,
      'city': city,
      'email': email,
      'password': password,
    };
  }
}
