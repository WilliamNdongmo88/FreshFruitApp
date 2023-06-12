import 'package:money_app/controller/Helper classes/MA_Helper_City.dart';
class  MA_Helper_Country {
  String code;
  String name;
  String currency;
  String id;
  String iso2;
  String iso3;
  List<MA_Helper_City> cities;

  MA_Helper_Country({
  required this.code,
  required this.name,
  required this.currency,
  required this.id,
  required this.iso2,
  required this.iso3,
  required this.cities,
  });
}
