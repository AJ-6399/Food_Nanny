class GetData {
  final String? usname;
  final String? postcode;
  final String? phno;
  final String? address;

  GetData({this.usname, this.postcode, this.phno, this.address});
  factory GetData.fromJson(Map<String, dynamic> json) {
    return GetData(
        usname: json['custName'],
        postcode: json['custPostCode'],
        phno: json['custTelNumber'],
        address: json['custAddress']);
  }
}
