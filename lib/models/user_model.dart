class UserModel {
  String? userName;
  String? email;
  String? password;
  String? city;
  String? address;
  String? profession;
  String? pose;
  String? vote;
  String? fullName;
  String? status;
  String? taskNumber;
  UserModel(
      {
        this.fullName,
        this.taskNumber,
        this.pose,
        this.userName,
        this.email,
        this.password,
        this.city,
        this.address,
        this.profession,
        this.vote,
        this.status
      });

  // receiving data from server
  factory UserModel.fromMapRegsitration(map) {
    return UserModel(
        email: map['email'],
        password: map['password'],
        city: map['city'],
        fullName: map['fullName']
    );
  }
  factory UserModel.fromMapPlayerRegistration(map) {
    return UserModel(
        email: map['email'],
        userName: map['userName'],
        password: map['password'],
        address: map['address'],
        city: map['city'],
        profession: map['profession'],
        status: map['status']
    );
  }
  // sending data to our server
  Map<String, dynamic> toMapRegistration() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'city': city
    };
  }
  Map<String, dynamic> toBecomePlayerRegistration() {
    return {
      'city': city,
      'email': email,
      'userName': userName,
      'password': password,
      'address': address,
      'profession': 'Player'
    };
  }
  Map<String, dynamic> toTask() {
    return {
      'pose':pose,
      'userName': userName,
      'taskNumber':taskNumber
    };
  }
  Map<String, dynamic> toVote() {
    return {
      'vote':'1'
    };
  }
  Map<String, dynamic> toStatus() {
    return {
      'status':status
    };
  }
  Map<String, dynamic> toUpdateAudience() {
    return {
      'userName':userName
    };
  }
  Map<String, dynamic> toUpdatePlayerRegistration() {
    return {
      'city': city,
      'userName': userName,
      'address': address,
    };
  }
}
