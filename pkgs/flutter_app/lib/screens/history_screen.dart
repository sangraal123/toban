import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key, required this.workspaceId});

  final String workspaceId;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アクティビティ一覧'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'リスト (Thanks)'),
            Tab(text: 'グラフ (Thanks)'),
            Tab(text: 'フレンドシップ'),
            Tab(text: 'リスト (ロールシェア)'),
            Tab(text: 'グラフ (ロールシェア)'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildThanksList(),
          _buildThanksGraph(),
          _buildFriendshipList(),
          _buildRoleShareList(),
          _buildRoleShareGraph(),
        ],
      ),
    );
  }

  Widget _buildThanksList() {
    // Dummy list of thanks token history
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.token),
          title: Text('User A sent 10 THX to User B'),
          subtitle: Text('2023-10-27 10:00'),
        );
      },
    );
  }

    Widget _buildThanksGraph() {
    return const Center(child: Text('Thanks Graph Placeholder'));
  }

  Widget _buildFriendshipList() {
     // Dummy list of friendships
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.favorite),
          title: Text('User C and User D'),
          trailing: Text('${100 - index * 10} points'),
        );
      },
    );
  }

  Widget _buildRoleShareList() {
    // Dummy list of role share history
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.share),
          title: Text('Role "Developer" was shared'),
           subtitle: Text('2023-10-27 11:00'),
        );
      },
    );
  }

  Widget _buildRoleShareGraph() {
    return const Center(child: Text('Role Share Graph Placeholder'));
  }
}
