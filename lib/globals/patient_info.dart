import 'package:app/models/patient.dart';

Patient patient = new Patient(
  firstName: 'Jason',
  lastName: 'Telanoff',
  middleName: 'F',
  dateOfBirth: '07/30/04',
  patientNumber: '123456',
  doses: [
    new Dose(
      productName: 'Vaccine!',
      lotNumber: '222',
      date: '01/12/21',
      professionalOrClinic: 'Dr. RealDoctor',
    )
  ],
);
