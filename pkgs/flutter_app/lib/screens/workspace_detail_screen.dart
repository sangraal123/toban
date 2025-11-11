import 'package:flutter/material.dart';
import '../components/custom_header.dart';

class WorkspaceDetailScreen extends StatelessWidget {
  const WorkspaceDetailScreen({super.key, required this.workspaceId});

  final String workspaceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        type: HeaderType.WorkspaceAndUserIcons,
        workspaceId: workspaceId,
        workspaceName: 'Workspace $workspaceId', // Dummy Name
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildThanksTokenSummary(context),
          const SizedBox(height: 32),
          _buildRecentActivity(context),
          const SizedBox(height: 32),
          _buildMyRoles(context),
        ],
      ),
      // TODO: Add StickyNav
    );
  }

  Widget _buildThanksTokenSummary(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text('送付可能量', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('1,000', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                SizedBox(width: 4),
                Text('THX', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('サンクストークンを送る'),
            ),
            const SizedBox(height: 24),
            const Text('受け取ったサンクストークン', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('500', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(width: 4),
                Text('THX', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('直近のアクティビティ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/workspace/$workspaceId/history');
              },
              child: const Text('もっと見る'),
            ),
          ],
        ),
        // Dummy list of activities
        ListTile(leading: Icon(Icons.token), title: Text('Alice sent 100 THX to Bob')),
        ListTile(leading: Icon(Icons.token), title: Text('Charlie sent 50 THX to you')),
        ListTile(leading: Icon(Icons.token), title: Text('You sent 20 THX to David')),
      ],
    );
  }

  Widget _buildMyRoles(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('担当当番', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        // Dummy list of roles
        Card(
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Role: Developer'),
            subtitle: Text('Responsible for coding'),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.design_services)),
            title: Text('Role: Designer'),
            subtitle: Text('Responsible for UI/UX'),
          ),
        ),
      ],
    );
  }
}
