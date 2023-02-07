import 'account.dart';

class Client {
  String? firstName;
  String? lastName;
  String? telephone;
  String? birthDay;
  String? email;
  Account? account;
  Client(String firstName, String lastName, String telephone, String birthDay,
      String email, Account account) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.telephone = telephone;
    this.birthDay = birthDay;
    this.email = email;
    this.account = account;
  }
  getClient() {
    return {
      "firstName": this.firstName,
      "lastName": this.lastName,
      "telephone": this.telephone,
      "account": this.account
    };
  }
}
