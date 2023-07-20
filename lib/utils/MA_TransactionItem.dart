class TransactionItem {
  // int id;
  String status;
  String user;
  String? icon;
  String amont;
  String city;
  String date;
  String codeReception;
  // String receiverName;
  // String receiverTel;
  TransactionItem(
      // this.id,
      this.status, this.user, this.icon, this.amont, this.city, this.date, this.codeReception,
      //this.receiverName, this.receiverTel
      ); 
}

class TransactionItemToFireBase {
  String lastTimeInPending;
  int amount;
  Map bank;
  String codeReception;
  Map deposit;
  String description;
  Map createdDate;
  Map inZone;
  Map outZone;
  Map owner;
  String ownerId;
  Map receiver;
  String status;
  bool to_bank;
  String? icon;

  TransactionItemToFireBase({
    required this.lastTimeInPending,
    required this.amount,
    required this.bank,
    required this.codeReception,
    required this.createdDate,
    required this.deposit,
    required this.description,
    required this.inZone,
    required this.outZone,
    required this.owner,
    required this.ownerId,
    required this.receiver,
    required this.status,
    required this.to_bank,
    this.icon,
  });
  Map<String, dynamic> toJson() {
    return {
      'lastTimeInPending': lastTimeInPending,
      'amont': amount,
      'bank': bank,
      'codeReception': codeReception,
      'createdDate': createdDate,
      'deposit': deposit,
      'description': description,
      'inZone': inZone,
      'outZone': outZone,
      'owner': owner,
      'ownerId': ownerId,
      'receiver': receiver,
      'status': status,
      'to_bank': to_bank,
    };
  }

  factory TransactionItemToFireBase.fromJson(Map<String, dynamic> json) {
    return TransactionItemToFireBase(
      lastTimeInPending: json['lastTimeInPending'],
      amount: json['amount'],
      bank: json['bank'],
      codeReception: json['codeReception'],
      createdDate: json['createdDate'],
      deposit: json['deposit'],
      description: json['description'],
      inZone: json['inZone'],
      outZone: json['outZone'],
      owner: json['owner'],
      ownerId: json['ownerId'],
      receiver: json['receiver'],
      status: json['status'],
      to_bank: json['to_bank'],
    );
  }
}

class FormData {
  String email;
  String password;
  FormData(this.email, this.password);
}
