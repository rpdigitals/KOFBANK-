//import 'Class/client.dart';
import 'Class/account.dart';
import 'function.dart';
import 'dart:io';

depositMoney() {
  showClients();
  stdout.write("Sur quel compte voulez vous déposer l'argent ? : ");
  int accountIndex = int.parse(stdin.readLineSync().toString());
  stdout.write("Combien voulez vous déposer ? : ");
  int amount = int.parse(stdin.readLineSync().toString());
  if (accountIndex > 0 && accountIndex < clients.length+1) {
    print("\n");
    print("Operation en cours ...");
    print("\n");

    clients[accountIndex - 1].getClient()['account'].depositMoney(amount);
    continueOrEnd();
  } else {
    depositMoney();
  }
}

withDrawMoney() {
  showClients();
  stdout.write("De quel compte voulez vous retirer l'argent ? : ");
  int accountIndex = int.parse(stdin.readLineSync().toString());
  stdout.write("Combien voulez vous retirer ? : ");
  int amount = int.parse(stdin.readLineSync().toString());
  if (accountIndex > 0 && accountIndex < clients.length + 1) {
    print("\n");
    print("Operation en cours ...");
    print("\n");

    clients[accountIndex - 1].getClient()['account'].withDrawMoney(amount);
    continueOrEnd();
  } else {
    withDrawMoney();
  }
}

transfertMoney() {
  showClients();
  stdout.write("De quel compte voulez vous envoyer l'argent ? : ");
  int withdrawAccountIndex = int.parse(stdin.readLineSync().toString());
  stdout.write("Combien voulez vous envoyer ? : ");
  int amount = int.parse(stdin.readLineSync().toString());

  stdout.write("Vers quel compte voulez vous envoyer l'argent ? : ");
  int depositAccountIndex = int.parse(stdin.readLineSync().toString());

  if (withdrawAccountIndex > 0 &&
      withdrawAccountIndex < clients.length + 1 &&
      withdrawAccountIndex > 0 &&
      depositAccountIndex < clients.length + 1 &&
      withdrawAccountIndex != depositAccountIndex) {
    Account.transferMoney(
        clients[withdrawAccountIndex - 1].getClient()["account"],
        clients[depositAccountIndex - 1].getClient()["account"],
        amount);
  } else {
    transfertMoney();
  }
}
