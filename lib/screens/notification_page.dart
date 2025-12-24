import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSectionTitle('Notifikasi Tugas'),
          _buildNotificationItem(
            icon: Icons.assignment_turned_in_rounded,
            title: 'Pengajuan tugas “Pengumpulan Laporan Akhir Assessment 3”',
            subtitle: 'Waktu: 3 Hari 9 Jam yang lalu',
            color: Colors.blue,
            isNew: true,
          ),
          const SizedBox(height: 25),
          _buildSectionTitle('Pengumuman'),
          _buildNotificationItem(
            icon: Icons.campaign_rounded,
            title: 'Maintenance Pra UAS Semester Genap 2025/2026',
            subtitle: 'Pemberitahuan terjadwal untuk sistem lms',
            color: Colors.orange,
          ),
          _buildNotificationItem(
            icon: Icons.build_circle_rounded,
            title: 'Pengumuman Maintenance',
            subtitle: 'Sistem telah diperbarui untuk performa lebih baik',
            color: Colors.pink,
          ),
          _buildNotificationItem(
            icon: Icons.warning_amber_rounded,
            title: 'Maintenance Pra UAS Semester Ganjil 2025/2026',
            subtitle: 'Riwayat pemeliharaan sistem sistem sebelumnya',
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 5),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    bool isNew = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isNew ? Colors.pink.withOpacity(0.02) : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: isNew ? Border.all(color: Colors.pink.withOpacity(0.1)) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isNew ? FontWeight.bold : FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: isNew ? Colors.pink.withOpacity(0.7) : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          if (isNew)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
