import 'package:flutter/material.dart';
import 'package:health_care/widgets/display_doctor.dart';

class AppointmentBooking extends StatelessWidget {
  const AppointmentBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [
        DisplayDoctor(
          imageLink:
              'https://clipground.com/images/the-doctor-is-in-clipart-6.png',
          dName: 'Dr.Azeem',
          dQualification: 'MD',
        ),
        DisplayDoctor(
          imageLink:
              'https://media.istockphoto.com/vectors/female-doctor-with-a-tablet-computer-vector-id165789486?k=6&m=165789486&s=612x612&w=0&h=cnLI0VgFN6hF7uB0L2ti3Bc-H8lNBcKNR3dZ_alhdVc=',
          dName: 'Dr.Shaheen',
          dQualification: 'MBBS',
        ),
        DisplayDoctor(
          imageLink:
              'https://media.istockphoto.com/vectors/doctor-vector-id165918451?k=6&m=165918451&s=612x612&w=0&h=imMDySGTttFcw_tEFYHsYjbh3mvMcJfUppndM-shdDg=',
          dName: 'Dr.Laila',
          dQualification: 'BAMS',
        ),
        DisplayDoctor(
          imageLink:
              'https://th.bing.com/th/id/R.73f17f59628da3c50a5ac731efb9b083?rik=3gPDInK%2fzind1g&riu=http%3a%2f%2fwww.clipartbest.com%2fcliparts%2f9i4%2f6xr%2f9i46xrzeT.png&ehk=k4j2MBAWRURVQmHNn%2bW2fkG5QjoTH2HeyE%2bM%2fCcbcjQ%3d&risl=&pid=ImgRaw&r=0',
          dName: 'Chota Doctor',
          dQualification: 'Surgeon',
        ),
      ],
    );
  }
}
