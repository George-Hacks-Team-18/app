class Patient {
  String firstName,
      lastName,
      middleName,
      dateOfBirth,
      product,
      patientNumber,
      password;
  int index;
  List<Dose> doses;

  Patient({
    this.firstName,
    this.lastName,
    this.middleName,
    this.dateOfBirth,
    this.product,
    this.doses,
    this.patientNumber,
    this.password,
    this.index,
  });
}

class Dose {
  String date, professionalOrClinic;

  Dose({this.date, this.professionalOrClinic});
}
