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
      debugShowCheckedModeBanner: false,
    );
  }
}

class TransactionDashboard extends StatelessWidget {
  const TransactionDashboard({super.key});

  Widget buildStatCard(
      String label, String amount, Color color, IconData icon) {
    return Expanded(
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(height: 8),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAmountRow(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildSection(
      String title, List<Widget> statCards, List<Widget> bottomStats) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with icon
            Row(
              children: [
                const Icon(Icons.bar_chart, color: Colors.black),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Filter buttons aligned right on a new line
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildFilterButton("Today"),
                _buildFilterButton("Yesterday"),
                _buildFilterButton("Last 7 Days"),
              ],
            ),

            const SizedBox(height: 16),

            // Stat cards in a row, equally expanded
            Row(children: statCards),

            const SizedBox(height: 12),
            const Divider(),

            // Bottom stats horizontally scrollable
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: bottomStats
                    .map((w) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: w,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        minimumSize: Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
      child: Text(label, style: const TextStyle(fontSize: 10)),
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
              "All Channels Transaction Count and Amount Analysis",
              [
                buildStatCard("No. of Trn", "4,019", Colors.blue, Icons.list),
                buildStatCard(
                    "Successful Trn", "3,920", Colors.green, Icons.check_circle),
                buildStatCard("Failed Trn", "99", Colors.red, Icons.cancel),
              ],
              [
                buildAmountRow("TOTAL TRN AMOUNT", "58.23 Cr.", Colors.black),
                buildAmountRow(
                    "SUCCESSFUL TRN AMOUNT", "57.93 Cr.", Colors.green),
                buildAmountRow("FAILED TRN AMOUNT", "29.45 Lakh", Colors.red),
                buildAmountRow(
                    "SUCCESS : FAILED RATIO", "98 : 2", Colors.blueGrey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
