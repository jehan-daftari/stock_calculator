import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/transaction_history_item.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('transactions')
            .orderBy('purchaseDate', descending: true)
            .limit(5)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final transactions = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return TransactionHistoryItem(
              symbol: data['symbol'],
              purchaseDate: (data['purchaseDate'] as Timestamp).toDate(),
              sellDate: (data['sellDate'] as Timestamp).toDate(),
              quantity: data['quantity'],
              profitOrLoss: data['profitOrLoss'],
            );
          }).toList();

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              itemCount: transactions.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: transactions[index],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
