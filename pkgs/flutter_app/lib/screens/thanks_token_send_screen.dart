import 'package:flutter/material.dart';

class ThanksTokenSendScreen extends StatefulWidget {
  const ThanksTokenSendScreen({super.key, required this.workspaceId});

  final String workspaceId;

  @override
  State<ThanksTokenSendScreen> createState() => _ThanksTokenSendScreenState();
}

class _ThanksTokenSendScreenState extends State<ThanksTokenSendScreen> {
  final _pageController = PageController();
  final List<String> _selectedUsers = [];
  double _amount = 100;

  void _toggleUser(String userId) {
    setState(() {
      if (_selectedUsers.contains(userId)) {
        _selectedUsers.remove(userId);
      } else {
        _selectedUsers.add(userId);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サンクストークンを送信'),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildUserSelectionStep(),
          _buildAmountSelectionStep(),
          _buildConfirmationStep(),
        ],
      ),
    );
  }

  Widget _buildUserSelectionStep() {
    // Dummy user list
    final users = List.generate(10, (index) => 'User ${index + 1}');

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final isSelected = _selectedUsers.contains(user);
              return CheckboxListTile(
                title: Text(user),
                value: isSelected,
                onChanged: (_) => _toggleUser(user),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: _selectedUsers.isNotEmpty ? () => _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut) : null,
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
            child: Text('送付量を選択 (${_selectedUsers.length}人)'),
          ),
        ),
      ],
    );
  }

  Widget _buildAmountSelectionStep() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${_amount.toInt()} THX', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          Slider(
            value: _amount,
            min: 0,
            max: 1000,
            divisions: 100,
            label: _amount.round().toString(),
            onChanged: (double value) {
              setState(() {
                _amount = value;
              });
            },
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
            child: const Text('確認へ'),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmationStep() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('確認', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text('${_selectedUsers.length}人に、それぞれ${_amount.toInt()} THX を送信します。'),
          const Spacer(),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
            child: const Text('送信'),
          ),
        ],
      ),
    );
  }
}
