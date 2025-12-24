import 'package:flutter/material.dart';

class MyClassesPage extends StatelessWidget {
  const MyClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> courses = [
      {'name': 'Bahasa Inggris: Business and Scientific', 'code': 'ENG101', 'instructor': 'Sarah Johnson, Ph.D'},
      {'name': 'Desain Antarmuka & Pengalaman Pengguna', 'code': 'UIUX202', 'instructor': 'Alex Smith, M.Ds'},
      {'name': 'Kewarganegaraan', 'code': 'CIV303', 'instructor': 'Dr. Budi Utomo'},
      {'name': 'Pemrograman Multimedia Interaktif', 'code': 'MMI404', 'instructor': 'Rina Wati, M.Kom'},
      {'name': 'Pemrograman Perangkat Bergerak Multimedia', 'code': 'MOB505', 'instructor': 'Andi Pratama, S.Kom'},
      {'name': 'Sistem Operasi', 'code': 'OS606', 'instructor': 'Prof. Haryanto'},
      {'name': 'Olah Raga', 'code': 'SPO707', 'instructor': 'Coach Bambang'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelas Saya'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.pink,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list_rounded),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return _buildCourseCard(
            courses[index]['name']!,
            courses[index]['code']!,
            courses[index]['instructor']!,
          );
        },
      ),
    );
  }

  Widget _buildCourseCard(String title, String code, String instructor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 8,
                color: Colors.pink,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.pink.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              code,
                              style: const TextStyle(
                                color: Colors.pink,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Icon(Icons.more_vert_rounded, color: Colors.grey, size: 20),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.person_pin_rounded, size: 16, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(
                            instructor,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.pink,
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                            ),
                            child: const Text('Masuk Kelas'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Tugas'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

