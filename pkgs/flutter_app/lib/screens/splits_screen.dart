import 'package:flutter/material.dart';

class SplitsScreen extends StatelessWidget {
  const SplitsScreen({super.key, required this.workspaceId});

  final String workspaceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splits'),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Navigate to new split screen
            },
            child: const Text('Create New'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildUnclaimedEarnings(),
          const SizedBox(height: 16),
          _buildSplitsList(),
        ],
      ),
    );
  }

  Widget _buildUnclaimedEarnings() {
    // Dummy unclaimed earnings section
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('未回収の報酬があります', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('0.5 ETH'),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                ),
                child: const Text('引き出す'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSplitsList() {
    // Dummy list of splits
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ExpansionTile(
            title: const Text('Split 0x123...abc'),
            subtitle: const Text('Created at 2023/10/27'),
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recipients:', style: TextStyle(fontWeight: FontWeight.bold)),
                    ListTile(title: Text('Alice (50%)')),
                    ListTile(title: Text('Bob (50%)')),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
