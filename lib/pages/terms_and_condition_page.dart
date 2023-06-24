import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Terms and Conditions",
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
                color: Color(0xfff6b9080),
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Body_for_TermsAndConditions(),
        ),
      ),
    );
  }
}

class Body_for_TermsAndConditions extends StatelessWidget {
  const Body_for_TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [Steps()],
      ),
    );
  }
}

class Step {
  Step(this.title, this.body, [this.isExpanded = false]);
  String title;
  String body;
  bool isExpanded;
}

List<Step> getSteps() {
  return [
    Step('User Consent',
        'The privacy policy is applicable to all the visitors of this website, and users are requested to fully read and understand the terms and conditions within the policy. By using this website, it is considered that visitors confirm their consent to the collection, use and dissemination of information in line with this privacy policy. If the terms and conditions of this privacy policy, in general or in particular, are not acceptable to any user then we suggest immediate suspension of the use of this website by such users.'),
    Step('Technical Information',
        'We may collect information about your browser and/or device that you use to access our site (like the type of browser and browser settings and the device identification number). Device information may or may not be personally identifiable depending upon whether it is linked to the identity of the user.\n\nWe may also automatically log information, such as your IP address, domain name, browser type, date and time of access, and other log file data. This information may be used to analyse trends and help us with administration of our site. We may collect statistical or non-personally-identifiable information about you including, for example, which pages you visit, how long you remain on a particular page, the website from which you came to our site, or similar information.\n\nWe also may collect aggregate information such as the total number of unique or return visitors to our site, or visiting a section of the site within a given timeframe. We may also use this information to measure the use of our site to improve our content.\n\nOur site uses Google Analytics cookies. Information collected by these cookies will be transferred to and stored by Google on servers in the USA in accordance with its privacy practices.\n\nIf you do not want us to deploy browser cookies to your device when you visit our site, you may set the browser to reject cookies or to notify the user when a web site tries to place cookies in the browser program. Rejecting cookies may affect your ability to use some features offered on our site.'),
    Step('We may use your personal information for the following purposes:',
        'To provide you with the services and information offered through our site.\n\nTo process your requests and respond to your inquiries.\n\nRegister you for any services you have signed up for.\n\nFor business administration, including statistical analysis and as may be required to perform our obligations under a contractual relationship with you.\n\nTo improve our site by helping us understand who uses the site.\n\nTo contact you about products and services offered by us which we believe may interest you and For fraud prevention and detection and to comply with applicable laws, regulations or codes of practice.'),
    Step("Who Will Have Access to Your Personal Information?",
        "Your personal information may be made available within the Infopercept Consulting Private Limited. They may need access to your personal information to perform their functions but will not use your personal information for any other purpose."),
    Step("Disclosure of information to third parties",
        "At no time do we provide your personal information to any person or entity outside of Infopercept Consulting Private Limited. The only exception to this would involve a circumstance where we would be compelled to by law enforcement, regulatory or other government agencies in order to comply with legal or regulatory obligations or requests. By providing information through the Infopercept website you are consenting to the disclosures described above."),
    Step("Security and Retention of Your Personal Information",
        "The security of your personal information is important to us. We take reasonable steps, including technical, administrative and physical safeguards, designed to protect the personal information submitted to us from loss, misuse and unauthorized access, disclosure, alteration and destruction.\n\nWe may retain your personal information for as long as your contact with you is active or as needed for the specific business purpose for which it was collected. In some cases, we may be required to retain information to comply with laws or regulations or other legal obligations, resolve disputes and enforce our agreements."),
    Step("International Data Transfers",
        "our personal information may be transferred to countries located outside your country or region, including to countries that may not provide a similar or adequate level of protection to that provided by your country or region. By using the site or otherwise providing personal information to us, you hereby expressly consent to the transfer of your personal information outside your country or region."),
    Step("Marketing",
        "We may contact you periodically by email to provide information regarding services and content that may be of interest to you. If applicable law requires that we receive your explicit consent before we send you certain types of marketing communications, we will only send you those types of communications after receiving your explicit consent. If you wish to stop receiving these types of communications from us, you can opt-out by contacting us at the email and address as described below or use any mechanism provided in the communication that you receive."),
    Step("Access, Correction and Other Individual Rights",
        "With your support, we will keep your personal information accurate and up-to-date. If we process your personal information, then you may have a right under data privacy laws to remove, amend, or correct your personal information at any time, subject to certain exceptions permitted by law. You also may have other rights including rights to object to or to restrict the processing of your personal data and data portability. You may also contact us to opt-out from any program or other service for which you may have registered via our sites. If you would like to access, correct or delete the personal information we hold about you, please contact us as described below.")
  ];
}

class Steps extends StatefulWidget {
  const Steps({Key? key}) : super(key: key);
  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  final List<Step> _steps = getSteps();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _renderSteps(),
      ),
    );
  }

  Widget _renderSteps() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          ExpansionPanelList(
            elevation: 0,
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _steps[index].isExpanded = !isExpanded;
              });
            },
            children: _steps.map<ExpansionPanel>(
              (Step step) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(
                        step.title,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    );
                  },
                  body: ListTile(
                    title: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFf2f2f2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          step.body,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Color(0xFF8c8c8c), fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ),
                  isExpanded: step.isExpanded,
                );
              },
            ).toList(),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Spacer(),
              Image.asset(
                "assets/images/img_2.png",
                height: 10,
              ),
              SizedBox(width: 10),
              Icon(
                Icons.circle,
                size: 5,
              ),
              SizedBox(width: 10),
              Text(
                "Terms | Privacy Policy",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
