class PasswordData {
  final int type;
  final String title;
  final String pwd;

  PasswordData({
    this.type,
    this.title,
    this.pwd,
  });
}

class NoteData {
  final int type;
  final String title;
  final String note;

  NoteData({
    this.type,
    this.title,
    this.note,
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
    this.type,
    this.title,
    this.cardNumber,
    this.expMonth,
    this.expYear,
    this.cvv,
  });
}

class AccountData {
  final int type;
  final String title;
  final String accountNumber;
  final String loginPassword;
  final String transactionPassword;
  final String notes;

  AccountData(
      {this.type,
      this.title,
      this.accountNumber,
      this.loginPassword,
      this.transactionPassword,
      this.notes,
      b});
}
