import 'package:flutter/material.dart';

class AssignmentDetailPage extends StatelessWidget {
  final String assignmentTitle;

  const AssignmentDetailPage({super.key, required this.assignmentTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas', style: TextStyle(fontSize: 18)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Assignment Header
            Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink, Colors.pinkAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'ASSESSMENT 1',
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    assignmentTitle,
                    style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded, color: Colors.white70, size: 16),
                      const SizedBox(width: 8),
                      const Text(
                        'Jumat, 26 Desember 2025, 23:59 WIB',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Status Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Status Pengiriman', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        const SizedBox(height: 5),
                        Row(
                          children: const [
                            Icon(Icons.check_circle_rounded, color: Colors.green, size: 18),
                            SizedBox(width: 8),
                            Text('Sudah dikirim', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Format File', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        const SizedBox(height: 5),
                        const Text('PDF (maks 5 MB)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Instructions Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Instruksi Tugas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  const SizedBox(height: 15),
                  _buildInstructionItem('Mendesain UI game FPS Android'),
                  _buildInstructionItem('Mencakup seluruh tampilan aplikasi'),
                  _buildInstructionItem('Dibuat rapi dan jelas'),
                  _buildInstructionItem('Menyertakan identitas game'),
                  _buildInstructionItem('Format PDF'),
                  _buildInstructionItem('Dipresentasikan via Zoom'),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Upload Button (Disabled because already submitted)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_document),
                  label: const Text('Edit Pengiriman'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.pink,
                    side: const BorderSide(color: Colors.pink),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.arrow_right_rounded, color: Colors.pink),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
