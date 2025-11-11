import 'package:flutter/material.dart';

class RoleAssignScreen extends StatefulWidget {
  const RoleAssignScreen({super.key, required this.workspaceId, required this.roleId});

  final String workspaceId;
  final String roleId;

  @override
  State<RoleAssignScreen> createState() => _RoleAssignScreenState();
}

class _RoleAssignScreenState extends State<RoleAssignScreen> {
  final _addressController = TextEditingController();
  DateTime? _selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (time == null) return;

    setState(() {
      _selectedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('当番を割り当てる'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRoleDetail(),
            const SizedBox(height: 32),
            const Text('ユーザー名 or ウォレットアドレス', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 24),
            const Text('開始日', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => _selectDateTime(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                child: Text(
                  _selectedDateTime?.toLocal().toString().substring(0, 16) ?? '日付と時刻を選択',
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement assign logic
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Assign'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleDetail() {
    // Dummy Role Detail
    return Row(
      children: [
        const CircleAvatar(radius: 30, child: Icon(Icons.local_offer, size: 30)),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Role: ${widget.roleId}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Text('This is a dummy description for the role.', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}
