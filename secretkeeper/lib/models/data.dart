class PasswordData {
  final int type;
  final String title;
  final String username;
  final String pwd;

  PasswordData({
    required this.type,
    required this.title,
    required this.username,
    required this.pwd,
  });
}

class NoteData {
  final int type;
  final String title;
  final String note;

  NoteData({
    required this.type,
    required this.title,
    required this.note,
  });
}

class CardData {
  final int type;
  final String title;
  final String cardNumber;
  final String expMonth;
  final String expYear;
  final String cvv;

  CardData({
    required this.type,
    required this.title,
    required this.cardNumber,
    required this.expMonth,
    required this.expYear,
    required this.cvv,
  });
}

class AccountData {
  final int type;
  final String title;
  final String accountNumber;
  final String loginPassword;
  final String transactionPassword;
  final String notes;

  AccountData({
    required this.type,
    required this.title,
    required this.accountNumber,
    required this.loginPassword,
    required this.transactionPassword,
    required this.notes,
  });
}

Stream<List<PasswordData>> pwdDatalist =
    Stream<List<PasswordData>>.fromIterable(
  <List<PasswordData>>[
    List<PasswordData>.generate(
        10,
        (int i) => PasswordData(
            type: 0, title: i.toString(), username: "username", pwd: "pwd")),
  ],
);
