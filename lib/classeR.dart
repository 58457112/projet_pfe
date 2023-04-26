class Appointment {
  final String patientName;
  final String doctorName;
  final DateTime date;
  final String time;

  Appointment({
    required this.patientName,
    required this.doctorName,
    required this.date,
    required this.time,
  });
}

final List<Appointment> appointments = [
  Appointment(
    patientName: 'John Doe',
    doctorName: 'Dr. Smith',
    date: DateTime.now(),
    time: '9:00 AM',
  ),
  Appointment(
    patientName: 'Jane Doe',
    doctorName: 'Dr. Johnson',
    date: DateTime.now(),
    time: '10:00 AM',
  ),
];
