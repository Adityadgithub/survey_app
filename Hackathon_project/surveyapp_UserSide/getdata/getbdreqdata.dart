// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class getbddata extends StatefulWidget {
//   const getbddata({Key? key}) : super(key: key);

//   @override
//   State<getbddata> createState() => _getbddataState();
// }

// class _getbddataState extends State<getbddata> {
//   var nulltest;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder<QuerySnapshot>(
//       stream:
//           FirebaseFiresatore.instance.collection('Blood Donation').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final services = snapshot.data!.docs;
//           List<Widget> servicesWidget = [];
//           for (var st in services) {
//             final _date = (st.data()! as Map<String, dynamic>)['Date'];
//             final _time = (st.data()! as Map<String, dynamic>)['Time'];
//             final _patientname =
//                 (st.data()! as Map<String, dynamic>)['Patient Name'];
//             final _patientcontact =
//                 (st.data()! as Map<String, dynamic>)['Patient contact'];
//             final _patientage =
//                 (st.data()! as Map<String, dynamic>)['Patient Age'];
//             final _bloodgrp =
//                 (st.data()! as Map<String, dynamic>)['Blood Group'];
//             final _liter = (st.data()! as Map<String, dynamic>)['Liter'];
//             final _requireddate =
//                 (st.data()! as Map<String, dynamic>)['Required Date'];
//             final _locationtype =
//                 (st.data()! as Map<String, dynamic>)['Location Type'];
//             final _address = (st.data()! as Map<String, dynamic>)['Address'];

//             nulltest = _date;

//             final datas = buildTile(
//               patientname: _patientname,
//               patientcontact: _patientcontact,
//               patientage: _patientage,
//               bloodgrp: _bloodgrp,
//               liter: _liter,
//               address: _address,
//               requireddate: _requireddate,
//               locationtype: _locationtype,
//               date: _date,
//               time: _time,
//             );
//             servicesWidget.add(datas);
//           }

//           double rows = servicesWidget.length / 2;
//           if (servicesWidget.length != 0 &&
//               servicesWidget.length != 1 &&
//               servicesWidget.length % 2 == 0) {
//             bpwidgetsnum = rows * 120;
//           } else if (servicesWidget.length == 1) {
//             bpwidgetsnum = 120;
//           } else if (servicesWidget.length == 0 ||
//               servicesWidget.length == null) {
//             bpwidgetsnum = 1;
//           } else {
//             bpwidgetsnum = (rows + 0.5) * 120;
//           }
//           if (nulltest == null && generaterepo == false)
//             return Center(
//                 child: SizedBox(
//               width: 200,
//               child: Text(
//                 "No Requests for Donation yet, Click Add (+) to post your donation request.",
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ));
//           if (generaterepo == false) {
//             return ListView(
//               clipBehavior: Clip.antiAlias,
//               children: servicesWidget,
//               shrinkWrap: true,
//             );
//           } else {
//             return GridView.count(
//               physics: NeverScrollableScrollPhysics(),
//               crossAxisSpacing: 0,
//               childAspectRatio: 2 / 1.3,
//               mainAxisSpacing: 0,
//               crossAxisCount: 2,
//               children: servicesWidget,
//               shrinkWrap: true,
//             );
//           }
//         }
//         return Center(child: CircularProgressIndicator.adaptive());
//       },
//     ));
//   }

//   buildTile({
//     patientname,
//     patientcontact,
//     patientage,
//     bloodgrp,
//     address,
//     liter,
//     requireddate,
//     locationtype,
//     date,
//     time,
//   }) {
//     // return bpcard(
//     //   systolic: systolic,
//     //   diastolic: diastolic,
//     //   pulse: pulse,
//     //   date: date,
//     //   time: time,
//     // );
//     if (generaterepo == false) {
//       return bdcard(
//         address: address,
//         bloodgrp: bloodgrp,
//         liter: liter,
//         locationtype: locationtype,
//         patientage: patientage,
//         patientcontact: patientcontact,
//         patientname: patientname,
//         requireddate: requireddate,
//         time: time,
//         date: date,
//       );
//     } else {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 5,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "$date",
//                 style: TextStyle(color: Colors.grey),
//               ),
//               Text(
//                 "$time",
//                 style: TextStyle(color: Colors.grey),
//               )
//             ],
//           ),
//           Row(
//             children: [
//               Text(
//                 "Systolic : ",
//                 style: TextStyle(color: Colors.cyan[900], fontSize: 14),
//               ),
//               // Text(
//               //   "$systolic mmHg",
//               //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//               // ),
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               Text(
//                 "Diastolic : ",
//                 style: TextStyle(color: Colors.cyan[900], fontSize: 14),
//               ),
//               // Text(
//               //   "$diastolic mmHg",
//               //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//               // ),
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               Text(
//                 "Pulse : ",
//                 style: TextStyle(color: Colors.cyan[900], fontSize: 14),
//               ),
//               // Text(
//               //   "$pulse bpm",
//               //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//               // ),
//             ],
//           ),
//         ],
//       );
//     }
//   }
// }
