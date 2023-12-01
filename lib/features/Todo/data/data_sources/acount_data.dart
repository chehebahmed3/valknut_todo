class AcountData {
  String? firstName;
  String? lastName;
  AcountData({required this.firstName, required this.lastName});
  static List<AcountData> acountList() {
    return [AcountData(firstName: '', lastName: '')];
  }
}
