import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> announcements = [
      {
        'title': 'Libur Semester Ganjil 2024/2025',
        'date': '24 Des 2024',
        'content': 'Libur semester akan dimulai dari tanggal 25 Desember 2024 hingga 5 Januari 2025. Perkuliahan akan aktif kembali pada 6 Januari 2025.',
        'category': 'Akademik'
      },
      {
        'title': 'Maintenance Sistem LMS',
        'date': '20 Des 2024',
        'content': 'Akan dilakukan pemeliharaan sistem rutin pada hari Sabtu malam pukul 22:00 WIB. Mohon maaf atas ketidaknyamanannya.',
        'category': 'Sistem'
      },
      {
        'title': 'Pendaftaran Beasiswa Unggulan',
        'date': '15 Des 2024',
        'content': 'Pendaftaran beasiswa unggulan batch 2 telah dibuka. Segera lengkapi berkas Anda di portal kemahasiswaan.',
        'category': 'Beasiswa'
      },
      {
        'title': 'Update Jadwal UAS Susulan',
        'date': '10 Des 2024',
        'content': 'Bagi mahasiswa yang belum mengikuti UAS, jadwal susulan sudah dapat dilihat di dashboard masing-masing.',
        'category': 'Ujian'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengumuman'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final item = announcements[index];
          return _buildAnnouncementCard(
            item['title']!,
            item['date']!,
            item['content']!,
            item['category']!,
          );
        },
      ),
    );
  }

  Widget _buildAnnouncementCard(String title, String date, String content, String category) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.pink.withOpacity(0.05),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.campaign_rounded, color: Colors.pink, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      category,
                      style: const TextStyle(
                        color: Colors.pink,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Baca Selengkapnya',
                        style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
