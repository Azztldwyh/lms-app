import 'package:flutter/material.dart';

class LessonContentPage extends StatelessWidget {
  final String title;

  const LessonContentPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Pembelajaran', style: TextStyle(fontSize: 18)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Category
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.pink, Colors.pinkAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MODUL PEMBELAJARAN',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),

            // Description
            const Text(
              'Deskripsi Materi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            const SizedBox(height: 10),
            Text(
              'Materi ini mencakup pemahaman mendalam mengenai $title. Mahasiswa diharapkan dapat menguasai konsep dasar dan implementasi praktis dari topik ini untuk menunjang pengerjaan tugas dan proyek akhir semester.',
              style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.6),
            ),

            const SizedBox(height: 30),

            // Learning Resources
            const Text(
              'Sumber Belajar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            const SizedBox(height: 15),
            
            _buildResourceItem(
              icon: Icons.videocam_rounded,
              title: 'Zoom Meeting Synchronous',
              subtitle: 'Klik untuk bergabung ke ruang pertemuan',
              color: Colors.blue,
            ),
            _buildResourceItem(
              icon: Icons.link_rounded,
              title: 'URL Materi',
              subtitle: 'Tautan referensi eksternal dan bacaan',
              color: Colors.green,
            ),
            _buildResourceItem(
              icon: Icons.picture_as_pdf_rounded,
              title: 'File PDF',
              subtitle: 'Unduh modul pembelajaran dalam format PDF',
              color: Colors.redAccent,
            ),
            _buildResourceItem(
              icon: Icons.touch_app_rounded,
              title: 'Interactive Content',
              subtitle: 'Pelajari materi melalui konten interaktif',
              color: Colors.orange,
            ),
            _buildResourceItem(
              icon: Icons.play_circle_filled_rounded,
              title: 'Video Pembelajaran',
              subtitle: 'Tonton rekaman penjelasan materi',
              color: Colors.purple,
            ),

            const SizedBox(height: 40),
            
            // Mark as Complete Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                ),
                child: const Text('Tandai Selesai Belajar', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.pink.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
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
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: Colors.grey),
        ],
      ),
    );
  }
}
