import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/MA_TransactionItem.dart';

class AllTransacction extends StatefulWidget {
  const AllTransacction({super.key});

  @override
  State<AllTransacction> createState() => _AllTransacctionState();
}

class _AllTransacctionState extends State<AllTransacction> {
  @override
  Widget build(BuildContext context) {
    List<TransactionItemToFireBase> alltransaction = [];
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .orderBy('name')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          if (snapshot.hasData) {
            alltransaction = snapshot.data!.docs
                .map((elt) => TransactionItemToFireBase.fromJson(
                    elt.data() as Map<String, dynamic>))
                .toList();
            return ListView.builder(
                itemCount: alltransaction.length,
                itemBuilder: (context, index) {
                  return Text(alltransaction[index].status);
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
