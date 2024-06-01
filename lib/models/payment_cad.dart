class PaymentCard {
  PaymentCard({
    required this.cardHolder,
    required this.cardNo,
    required this.cvv2,
    required this.expYear,
    required this.expMonth,
    required this.title,
  });

  late final String cardHolder;
  late final String cardNo;
  late final String cvv2;
  late final int expYear;
  late final int expMonth;
  late final String title;

  PaymentCard.fromJson(Map<String, dynamic> json) {
    cardHolder = json['cardHolder'];
    cardNo = json['cardNo'];
    cvv2 = json['cvv2'];
    expYear = json['expYear'];
    expMonth = json['expMonth'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cardHolder'] = cardHolder;
    _data['cardNo'] = cardNo;
    _data['cvv2'] = cvv2;
    _data['expYear'] = expYear;
    _data['expMonth'] = expMonth;
    _data['title'] = title;
    return _data;
  }
}
