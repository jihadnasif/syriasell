class ViewCurrencyModel {
  int? id;
  String? currencySymbol;

  ViewCurrencyModel({this.id, this.currencySymbol});

  ViewCurrencyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currencySymbol = json['currency_symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['currency_symbol'] = this.currencySymbol;
    return data;
  }
}
