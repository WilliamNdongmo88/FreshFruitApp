import 'package:equatable/equatable.dart';

class MA_Helper_City extends Equatable{
  String id;
  String code;
  String name;
  String countryId;


  MA_Helper_City({
    required this.id,
    required this.code,
    required this.name,
    required this.countryId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, code, name, countryId];

  @override
  bool get stringify => true;
}
