import 'dart:io';
import 'operations.dart';
import 'Class/client.dart';
import 'Class/account.dart';

Client test = Client(
    "firstName", "lastName", "telephone", "birthDay", "email", Account("c"));
const int tabSpace = 25;
const String space = ' ';
const String line = '_';
List<Client> clients = [test];

//trier une liste de string par oredre alphabetique

lineSpace() {
  print('\n');
}

tableHead() {
  lineSpace();
  print(line * tabSpace * 5);
  lineSpace();
  String accountNumberTh = "#";
  String nameTh = "Nom";
  String telephoneTh = "Telephone";
  String soldeTh = "Solde";
  String accountTypeTh = "Type de compte";
  stdout.write("$accountNumberTh");
  stdout.write(space * (tabSpace - accountNumberTh.length));
  stdout.write("$nameTh");
  stdout.write(space * (tabSpace - nameTh.length));
  stdout.write("$telephoneTh");
  stdout.write(space * (tabSpace - telephoneTh.length));
  stdout.write("$soldeTh");
  stdout.write(space * (tabSpace - soldeTh.length));
  stdout.write("$accountTypeTh");
  stdout.write(space * (tabSpace - accountTypeTh.length));
  lineSpace();
  print(line * tabSpace * 5);
  lineSpace();
}

userList() {
  tableHead();
  for (int i = 0; i < clients.length; i++) {
    String n = (i + 1).toString();
    String nameTd = clients[i].getClient()['firstName'];
    String telephoneTd = clients[i].getClient()['telephone'];
    String soldeTd =
        clients[i].getClient()['account'].getAccount()['amount'].toString();
    var accountTypeTd =
        clients[i].getClient()['account'].getAccount()['accountType'];
    stdout.write(n);
    stdout.write(space * (tabSpace - n.length));

    stdout.write(nameTd);
    stdout.write(space * (tabSpace - nameTd.length));

    stdout.write(telephoneTd);
    stdout.write(space * (tabSpace - telephoneTd.length));

    stdout.write(soldeTd);
    stdout.write(space * (tabSpace - soldeTd.length));

    stdout.write(accountTypeTd);
    lineSpace();
  }
  print(line * tabSpace * 5);
  lineSpace();
  continueOrEnd();
}

showClients() {
  tableHead();
  for (int i = 0; i < clients.length; i++) {
    String n = (i + 1).toString();
    String nameTd = clients[i].getClient()['firstName'];
    String telephoneTd = clients[i].getClient()['telephone'];
    String soldeTd =
        clients[i].getClient()['account'].getAccount()['amount'].toString();
    var accountTypeTd =
        clients[i].getClient()['account'].getAccount()['accountType'];
    stdout.write(n);
    stdout.write(space * (tabSpace - n.length));

    stdout.write(nameTd);
    stdout.write(space * (tabSpace - nameTd.length));

    stdout.write(telephoneTd);
    stdout.write(space * (tabSpace - telephoneTd.length));

    stdout.write(soldeTd);
    stdout.write(space * (tabSpace - soldeTd.length));

    stdout.write(accountTypeTd);
    print('\n');
  }
  print(line * tabSpace * 5);
  lineSpace();
}

start() {
  List<String> operations = [
    'AJOUTER UN CLIENT',
    'LISTE DES CLIENTS',
    'FAIRE UN DEPOT',
    'FAIRE UN RETRAIT',
    'TRANSFERER DE L\'ARGENT'
  ];
  String welcomeText = 'BIENVENUE SUR KOFBANK';
  String style = '-' * 10;
  String operationQuestion = ' Qu\'elle opération voulez-vous éffectuer ? : ';
  lineSpace();
  print(style + ' ' + welcomeText + ' ' + style);
  for (int i = 0; i < operations.length; i++) {
    stdout.write(i + 1);
    print(' -- ' + operations[i]);
  }
  lineSpace();
  stdout.write(operationQuestion);
  String op = stdin.readLineSync().toString();
  List<String> opResponse = ['1', '2', '3', '4', '5'];
  if (opResponse.contains(op)) {
    int operation = int.parse(op);
    switch (operation) {
      case 1:
        createClient();
        break;
      case 2:
        userList();
        break;
      case 3:
        depositMoney();
        break;
      case 4:
        withDrawMoney();
        break;
      case 5:
        transfertMoney();
        break;
      default:
        start();
    }
  } else {
    start();
  }

  lineSpace();
}

end() {
  print("Vous avez quitté le programme KOF BANK");
  exit(0);
}

verifyCorrectType(String accountType) {
  List<String> typeOfAccounts = ['c', 'e'];
  if (!typeOfAccounts.contains(accountType)) {
    print(
        "Vous devez taper 'c' pour créer un compte courant et 'e' pour un compte epargne");
    String accountType = stdin.readLineSync().toString();
    verifyCorrectType(accountType);
  }
}

continueOrEnd() {
  print("taper 'c' pour éffectuer une autre opération, ou ");
  stdout.write("taper 'q' pour quitter le programe : ");
  String res = stdin.readLineSync().toString();
  List<String> list = ['q', 'c'];
  if (list.contains(res)) {
    if (res == 'c') {
      start();
    } else {
      end();
    }
  } else {
    print('Vous devez taper q ou c pour continuer ou quitter le programme ');
    continueOrEnd();
  }
}

createClient() {
  stdout.write('Nom du client : ');

  String firstName = stdin.readLineSync().toString();

  stdout.write('Prenom du client : ');

  String lastName = stdin.readLineSync().toString();

  stdout.write('Telephone du client : ');

  String telephone = stdin.readLineSync().toString();

  stdout.write('Adresse mail du client : ');

  String email = stdin.readLineSync().toString();

  stdout.write('Date de naissance du client : ');

  String birthDay = stdin.readLineSync().toString();

  stdout.write('Type de compte : ');
  stdout.write(
      "Taper 'c' pour créer un compte courant et 'e' pour un compte epargne : ");

  String accountType = stdin.readLineSync().toString();

  verifyCorrectType(accountType);

  Account account = Account(accountType);

  Client client =
      Client(firstName, lastName, telephone, birthDay, email, account);
  print("Le compte a été créé avec succès");
  clients.add(client);
  client.getClient()['account'].setAccountNumber(clients.length);
  continueOrEnd();
}
