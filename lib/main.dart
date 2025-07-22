import 'package:flutter/material.dart';

void main() {
  runApp(const TransactionDashboardApp());
}

class TransactionDashboardApp extends StatelessWidget {
  const TransactionDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction Dashboard',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TransactionDashboard(),
    );
  }
}

class TransactionDashboard extends StatelessWidget {
  const TransactionDashboard({super.key});

  Widget buildStatCard(String label, String value, Color color, IconData icon) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(icon, color: color, size: 16),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(label, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAmountRow(String label, String value, Color color) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 12)),
        Text(label,
            style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }

  Widget buildSection(
    String title,
    List<Widget> statCards,
    List<Widget> bottomStats,
  ) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Filter Buttons in one row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.bar_chart, color: Colors.black),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // Filter buttons aligned to the right
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text("Today", style: TextStyle(fontSize: 12)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Yesterday", style: TextStyle(fontSize: 12)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Last 7 Days", style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(children: statCards),
            const Divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: bottomStats,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transaction Dashboard")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSection(
              "All Channels: Transaction Count and Amount Analysis",
              [
                buildStatCard("No. of Trn", "4,019", Colors.blue, Icons.list),
                buildStatCard(
                    "Successful Trn", "3,920", Colors.green, Icons.check_circle),
                buildStatCard("Failed Trn", "99", Colors.red, Icons.cancel),
              ],
              [
                buildAmountRow("TOTAL TRN AMOUNT", "58.23 Cr.", Colors.black),
                buildAmountRow("SUCCESSFUL TRN AMOUNT", "57.93 Cr.", Colors.green),
                buildAmountRow("FAILED TRN AMOUNT", "29.45 Lakh", Colors.red),
                buildAmountRow("SUCCESS : FAILED RATIO", "98 : 2", Colors.blueGrey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
