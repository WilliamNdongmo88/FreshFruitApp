class TransactionItem {
  String status;
  String user;
  String icon;
  String amont;
  String city;
  String date;
  TransactionItem(
      this.status, this.user, this.icon, this.amont, this.city, this.date);
}

class FormData {
  String email;
  String password;
  FormData(this.email, this.password);
}
