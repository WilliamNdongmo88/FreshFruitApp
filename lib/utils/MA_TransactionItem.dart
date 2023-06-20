class TransactionItem {
  int id;
  String status;
  String user;
  String? icon;
  String amont;
  String city;
  String date;
  TransactionItem(
      this.id,
      this.status, this.user, this.icon, this.amont, this.city, this.date);
}

class TransactionItemToFireBase {
  String lastTimeInPending;
  String amont;
  Map bank;
  String codeReception;
  String deposit;
  String description;
  String createdDate;
  Map inZone;
  Map outZone;
  Map owner;
  String ownerId;
  Map receiver;
  String status;
  String to_bank;
  String? icon;

  TransactionItemToFireBase({
    required this.lastTimeInPending,
    required this.amont,
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
      'amont': amont,
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
      amont: json['amont'],
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
