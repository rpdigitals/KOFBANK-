import 'dart:io';
import 'operations.dart';
import 'Class/client.dart';
import 'Class/account.dart';

const int tabSpace = 25;
const String space = ' ';
const String line = '_';
List<Client> clients = [];
// List<String> clientsName = [];
// List<String> clientsNameOrdered = [];
//List<Client> clientsOrdered = [];
//ordonner une liste de strings par ordre croissant

lineSpace() {
  print('\n');
}

orderClient() {
  List<String> clientsName = [];
  List<String> clientsNameOrdered = [];
  List<Client> clientsOrdered = [];
  for (Client client in clients) {
    String firstName = client.getClient()["firstName"];
    String lastName = client.getClient()["lastName"];
    String fullName = firstName + " " + lastName;
    clientsName.add(fullName);
  }
  for (int i = 0; i < clientsName.length; i++) {
    clientsNameOrdered.add(clientsName[i]);
  }
  clientsNameOrdered.sort((a, b) => a.compareTo(b));

  for (String name in clientsNameOrdered) {
    clientsOrdered.add(clients[clientsName.indexOf(name)]);
  }
  return clientsOrdered;
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
  List<Client> clientsOrdered = orderClient();
  for (int i = 0; i < clientsOrdered.length; i++) {
    String n = (i + 1).toString();
    String nameTd = clientsOrdered[i].getClient()['firstName'];
    String name2Td = clientsOrdered[i].getClient()['lastName'];
    String fullNameTd = nameTd + " " + name2Td;
    String telephoneTd = clientsOrdered[i].getClient()['telephone'];
    String soldeTd = clientsOrdered[i]
        .getClient()['account']
        .getAccount()['amount']
        .toString();
    var accountTypeTd =
        clientsOrdered[i].getClient()['account'].getAccount()['accountType'];
    stdout.write(n);
    stdout.write(space * (tabSpace - n.length));

    stdout.write(fullNameTd);
    stdout.write(space * (tabSpace - fullNameTd.length));

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
  List<Client> clientsOrdered = orderClient();
  for (int i = 0; i < clientsOrdered.length; i++) {
    String n = (i + 1).toString();
    String nameTd = clientsOrdered[i].getClient()['firstName'];
    String name2Td = clientsOrdered[i].getClient()['lastName'];
    String fullNameTd = nameTd + " " + name2Td;
    String telephoneTd = clientsOrdered[i].getClient()['telephone'];
    String soldeTd = clientsOrdered[i]
        .getClient()['account']
        .getAccount()['amount']
        .toString();
    var accountTypeTd =
        clientsOrdered[i].getClient()['account'].getAccount()['accountType'];
    stdout.write(n);
    stdout.write(space * (tabSpace - n.length));

    stdout.write(fullNameTd);
    stdout.write(space * (tabSpace - fullNameTd.length));

    stdout.write(telephoneTd);
    stdout.write(space * (tabSpace - telephoneTd.length));

    stdout.write(soldeTd);
    stdout.write(space * (tabSpace - soldeTd.length));

    stdout.write(accountTypeTd);
    lineSpace();
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
