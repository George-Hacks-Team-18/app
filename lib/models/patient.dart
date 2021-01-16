class Patient {
  String firstName, lastName, middleName, dateOfBirth, patientNumber;
  List<Dose> doses;

  Patient(
      {this.firstName,
      this.lastName,
      this.middleName,
      this.dateOfBirth,
      this.patientNumber,
      this.doses});
}

class Dose {
  String productName, lotNumber, date, professionalOrClinic;

  Dose(
      {this.productName, this.lotNumber, this.date, this.professionalOrClinic});
}
