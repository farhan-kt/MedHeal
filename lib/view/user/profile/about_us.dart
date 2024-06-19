import 'package:flutter/material.dart';
import 'package:medheal/widgets/text_widgets.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 240, 242),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 238, 240, 242),
          title: poppinsText(
              text: 'MedHeal',
              color: const Color(0xFF1A1A1A),
              fontSize: 25,
              fontWeight: FontWeight.bold),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .03, vertical: size.height * .02),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              poppinsHeadText(text: 'About Us', fontSize: 20),
              const SizedBox(
                height: 10,
              ),
              poppinsText(
                  text:
                      'Welcome to MedHeal, your trusted partner in managing your health and wellness appointments effortlessly. MedHeal is designed to streamline the process of scheduling and managing doctor appointments, ensuring that you receive the care you need without the hassle.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
              poppinsHeadText(text: 'Our Mission', fontSize: 20),
              const SizedBox(
                height: 10,
              ),
              poppinsText(
                  text:
                      'At MedHeal, our mission is to enhance the healthcare experience by providing a user-friendly platform that connects patients with healthcare providers seamlessly. We aim to simplify the appointment process, making it easier for you to access the medical attention you need, when you need it.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
              poppinsHeadText(text: 'Key Features', fontSize: 20),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'Doctor Scheduling:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'Easily book appointments with your preferred healthcare professionals. Our intuitive scheduling system allows you to find and secure appointments that fit your schedule.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'Manage Your Appointments:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'Keep track of all your medical appointments in one place. View your upcoming, completed, and cancelled appointments with ease, so you never miss an important visit.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'Payment Options:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'Pay for your appointments directly or online. We offer flexible payment methods to ensure your convenience and peace of mind.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'Notifications:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'Stay informed with our local notifications feature. Receive reminders for your upcoming appointments one hour in advance, ensuring you are always prepared. Additionally, get notified when new doctors are appointed, keeping you updated on the latest additions to our healthcare network.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
              poppinsHeadText(text: 'Why Choose MedHeal?', fontSize: 20),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'Convenience:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'Our app is designed to make your life easier. From scheduling appointments to managing payments and receiving timely notifications, MedHeal covers all your healthcare needs.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'Reliability:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'We partner with trusted healthcare providers to ensure you receive high-quality medical care. Our robust appointment system ensures that your booking is secure and reliable.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'User-Friendly Interface:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'MedHeal’s interface is intuitive and easy to navigate, making it simple for anyone to use. Whether you are tech-savvy or not, you’ll find our app straightforward and efficient.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
              poppinsHeadText(text: 'Join Our Community', fontSize: 20),
              const SizedBox(
                height: 10,
              ),
              poppinsText(
                  text:
                      'Become a part of the MedHeal community and take control of your healthcare journey. Download the MedHeal Doctor Appointment App today and experience the future of medical appointment management.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 10,
              ),
              poppinsText(
                  text:
                      ' Thank you for choosing MedHeal. Your health is our priority.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ));
  }
}
