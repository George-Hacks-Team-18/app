class Patient {
  String firstName, lastName, middleName, dateOfBirth, product, patientNumber;
  List<Dose> doses;

  Patient(
      {this.firstName,
      this.lastName,
      this.middleName,
      this.dateOfBirth,
      this.product,
      this.doses,
      this.patientNumber});
}

class Dose {
  String date, professionalOrClinic;

  Dose({this.date, this.professionalOrClinic});
}
