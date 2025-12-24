import 'package:flutter/material.dart';
import 'course_detail_page.dart';

class MyClassesPage extends StatelessWidget {
  const MyClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> courses = [
      {
        'name': 'Bahasa Inggris: Business and Scientific',
        'code': 'ENG101-A',
        'instructor': 'Sarah Johnson, Ph.D',
        'startDate': '12 Sep 2024',
        'semester': 'Semester 1',
        'progress': 0.87,
      },
      {
        'name': 'Desain Antarmuka & Pengalaman Pengguna',
        'code': 'UIUX202-B',
        'instructor': 'Alex Smith, M.Ds',
        'startDate': '15 Sep 2024',
        'semester': 'Semester 3',
        'progress': 0.89,
      },
      {
        'name': 'Kewarganegaraan',
        'code': 'CIV303-D', // Uniquified if needed
        'instructor': 'Dr. Budi Utomo',
        'startDate': '10 Sep 2024',
        'semester': 'Semester 1',
        'progress': 0.86,
      },
      {
        'name': 'Pemrograman Multimedia Interaktif',
        'code': 'MMI404-D',
        'instructor': 'Rina Wati, M.Kom',
        'startDate': '14 Sep 2024',
        'semester': 'Semester 5',
        'progress': 0.90,
      },
      {
        'name': 'Pemrograman Perangkat Bergerak Multimedia',
        'code': 'MOB505-E',
        'instructor': 'Andi Pratama, S.Kom',
        'startDate': '16 Sep 2024',
        'semester': 'Semester 5',
        'progress': 0.88,
      },
      {
        'name': 'Sistem Operasi',
        'code': 'OS606-F',
        'instructor': 'Prof. Haryanto',
        'startDate': '11 Sep 2024',
        'semester': 'Semester 3',
        'progress': 0.87,
      },
      {
        'name': 'Olah Raga',
        'code': 'SPO707-G',
        'instructor': 'Coach Bambang',
        'startDate': '13 Sep 2024',
        'semester': 'Semester 1',
        'progress': 0.86,
      },
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
          final course = courses[index];
          return _buildCourseCard(
            context,
            course['name'],
            course['code'],
            course['instructor'],
            course['startDate'],
            course['semester'],
            course['progress'],
          );
        },
      ),
    );
  }

  Widget _buildCourseCard(
    BuildContext context,
    String title,
    String code,
    String instructor,
    String startDate,
    String semester,
    double progress,
  ) {
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
                          Text(
                            semester,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.person_pin_rounded, size: 16, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(
                            instructor,
                            style: const TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today_rounded, size: 16, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(
                            'Mulai: $startDate',
                            style: const TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Progres Belajar',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black54),
                          ),
                          Text(
                            '${(progress * 100).toInt()}%',
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.pink),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.pink.withOpacity(0.1),
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.pink),
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseDetailPage(courseName: title),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Masuk Kelas'),
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
