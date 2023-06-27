import 'package:money_app/controller/Helper classes/MA_Helper_Bank.dart';
import 'package:money_app/controller/Helper classes/MA_Helper_Manual.dart';

class MA_Helper_Transfert{

    int? Amount;
    String? SenderCity;
    String? ReceiverCity;
    String? ReceptionCode;
    MA_Helper_Bank? BankInfo;
    MA_Helper_Manual? ManualInfo;

    MA_Helper_Transfert(this.Amount,this.SenderCity,this.ReceiverCity,this.ReceptionCode,
        this.BankInfo,this.ManualInfo);
}
