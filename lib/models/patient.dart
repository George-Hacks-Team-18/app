class Patient {
  final String firstName, lastName, middleName, dateOfBirth, patientNumber;
  final List<Dose> doses;

  Patient(
      {this.firstName,
      this.lastName,
      this.middleName,
      this.dateOfBirth,
      this.patientNumber,
      this.doses});
}

class Dose {
  final String productName, lotNumber, date, professionalOrClinic;

  Dose(
      {this.productName, this.lotNumber, this.date, this.professionalOrClinic});
}
