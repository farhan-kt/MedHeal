import 'package:flutter/material.dart';
import 'package:medheal/widgets/text_widgets.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

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
              text: 'MedHeal Service',
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
              poppinsHeadText(text: 'Customer Service', fontSize: 20),
              const SizedBox(
                height: 10,
              ),
              poppinsText(
                  text:
                      'At MedHeal, we are committed to providing exceptional support to ensure your experience with our app is seamless and satisfactory. Our customer service team is here to assist you with any questions, concerns, or issues you may encounter.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
              poppinsHeadText(text: 'How Can We Help You?', fontSize: 20),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'Common Inquiries:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'Find answers to frequently asked questions about using the MedHeal Doctor Appointment App. Whether you need help with booking appointments, managing your schedule, or making payments, our FAQs section has got you covered.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'Technical Support:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'Encountering technical difficulties? Our technical support team is ready to assist you with troubleshooting and resolving any issues you might face while using the app.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'Billing and Payments:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'Have questions about payments or billing? Our support team can help you understand your payment options, transaction history, and assist with any billing inquiries.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'Feedback and Suggestions:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'Your feedback is invaluable to us. If you have any suggestions or comments on how we can improve our services, please let us know. We are always looking for ways to enhance your experience.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
              poppinsHeadText(text: 'Contact Us', fontSize: 20),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'Email Support:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'Reach out to us via email at support @medhealapp.com. Our team will respond to your queries within 24 hours.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 10,
              ),
              poppinsHeadText(text: 'Phone Support:'),
              const SizedBox(
                height: 8,
              ),
              poppinsText(
                  text:
                      'Prefer to speak with a customer service representative? Call us at +91 999 123-4567. Our phone support is available Monday to Friday, from 9:00 AM to 6:00 PM (EST)',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
              poppinsHeadText(text: 'Help Center', fontSize: 20),
              const SizedBox(
                height: 10,
              ),
              poppinsText(
                  text:
                      'Visit our Help Center for detailed guides and tutorials on how to use the MedHeal Doctor Appointment App. From step-by-step instructions to video tutorials, our Help Center is designed to make your experience as smooth as possible.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
              poppinsHeadText(text: 'Your Satisfaction Matters', fontSize: 20),
              const SizedBox(
                height: 10,
              ),
              poppinsText(
                  text:
                      'At MedHeal, your satisfaction is our priority. We are dedicated to ensuring that your experience with our app meets your expectations and healthcare needs. If you have any concerns or are not completely satisfied with our service, please do not hesitate to contact us. We are here to help.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 10,
              ),
              poppinsText(
                  text:
                      'Thank you for choosing MedHeal. Your health is important to us, and we are here to support you every step of the way.',
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ));
  }
}
