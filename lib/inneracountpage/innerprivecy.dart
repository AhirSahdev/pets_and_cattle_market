import 'package:flutter/material.dart';

class privacy extends StatelessWidget {
  const privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Privacy Policy"),
            SizedBox(height: 10,),
            Text("      SoftwareDoer built the Pet Cart app as a Free app. This SERVICE is provided by SoftwareDoer at no cost and is intended for use as is."),
            SizedBox(height: 10,),
            Text("      This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service."),
            SizedBox(height: 10,),
            Text("      If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy."),
            SizedBox(height: 10,),
            Text("      The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Pet Cart unless otherwise defined in this Privacy Policy."),


          ],
        ),
      )
    );
  }
}
