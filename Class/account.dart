import '../function.dart';

class Account {
  int? accountNumber;
  int amount = 0;
  DateTime? createdAt;
  String? accountType;

  Account(String accountType) {
    this.accountNumber = 0;
    this.amount = amount;
    this.createdAt = DateTime.now();
    this.accountType = accountType;
  }

  setAccountNumber(int accountNumber) {
    this.accountNumber = accountNumber;
  }

  getAccountType() {
    return this.accountType;
  }

  depositMoney(int amount) {
    this.amount += amount;
    print("Dépot de $amount f sur ce compte éffectué avec succès");
  }

  withDrawMoney(int amount) {
    if (this.getAccountType() == "e") {
      lineSpace();
      print("Ce compte est un compte épargne");
      lineSpace();
      continueOrEnd();
    }
    if (this.amount < amount) {
      print("Le solde de ce compte est insufisant pour cet operation");
    } else {
      this.amount -= amount;
      print("retrait de $amount f de ce compte éffectué avec succès");
    }
    start();
  }

  static transferMoney(
      Account transfertAccount, Account depositAccount, int amount) {
    if (transfertAccount.getAccountType() == "e") {
      lineSpace();
      print("Ce compte est un compte épargne");
      lineSpace();
      continueOrEnd();
    }
    if (transfertAccount.amount < amount) {
      lineSpace();
      print("Le solde de ce compte est insufisant pour cet operation");
      lineSpace();
    } else {
      lineSpace();
      print("operationen cours ...");
      lineSpace();
      if (transfertAccount.amount < amount) {
        print("Le solde de ce compte est insufisant pour cet operation");
        lineSpace();
      } else {
        transfertAccount.amount -= amount;
        depositAccount.amount += amount;
        print("Transfert reussi");
      }
    }
    continueOrEnd();
  }

  getAccount() {
    accountNumber = this.accountNumber;
    amount = this.amount;
    createdAt = this.createdAt;
    accountType = this.accountType;
    return {
      "accountNumber": this.accountNumber,
      "amount": this.amount,
      "accountType": this.accountType,
    };
  }

  showAmount() {
    accountNumber = this.accountNumber;
    print("Solde = $amount");
  }
}
