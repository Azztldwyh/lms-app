import 'package:flutter/material.dart';
import 'lesson_content_page.dart';
import 'assignment_detail_page.dart';

class CourseDetailPage extends StatelessWidget {
  final String courseName;

  const CourseDetailPage({super.key, required this.courseName});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(courseName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.pink,
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Materi'),
              Tab(text: 'Tugas'),
              Tab(text: 'Kuis'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildMeetingList(),
            _buildTaskList(context),
            const Center(child: Text('Daftar Kuis Kosong')),
          ],
        ),
      ),
    );
  }

  Widget _buildMeetingList() {
    final List<Map<String, String>> meetings = [
      {'title': 'Pengantar User Interface Design', 'desc': 'Pendahuluan and kontrak perkuliahan'},
      {'title': 'Konsep User Interface Design', 'desc': 'Prinsip desain dan elemen dasar UI'},
      {'title': 'Interaksi pada User Interface Design', 'desc': 'Model interaksi dan user behavior'},
      {'title': 'Ethnographic Observation', 'desc': 'Metode riset pasar dan observasi pengguna'},
      {'title': 'UID Testing', 'desc': 'Usability testing dan feedback gathering'},
      {'title': 'Assessment 1', 'desc': 'Ujian tengah semester / Capstone part 1'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: meetings.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(15),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${index + 1}',
                style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              meetings[index]['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                meetings[index]['desc']!,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            trailing: const Icon(Icons.play_circle_fill_rounded, color: Colors.pink),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LessonContentPage(title: meetings[index]['title']!),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTaskList(BuildContext context) {
    final List<Map<String, String>> assignments = [
      {
        'title': 'Tugas 01 – UID Android Mobile Game',
        'deadline': 'Jumat, 26 Desember 2025',
        'status': 'Sudah dikirim'
      },
      {
        'title': 'Tugas 02 – Wireframe and Prototyping',
        'deadline': 'Jumat, 2 Januari 2026',
        'status': 'Belum dikirim'
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: assignments.length,
      itemBuilder: (context, index) {
        final item = assignments[index];
        final bool isSubmitted = item['status'] == 'Sudah dikirim';

        return Container(
          margin: const EdgeInsets.only(bottom: 15),
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
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(15),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (isSubmitted ? Colors.green : Colors.pink).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                isSubmitted ? Icons.assignment_turned_in_rounded : Icons.assignment_late_rounded,
                color: isSubmitted ? Colors.green : Colors.pink,
              ),
            ),
            title: Text(
              item['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text('Tenggat: ${item['deadline']}', style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: (isSubmitted ? Colors.green : Colors.pink).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    item['status']!,
                    style: TextStyle(
                      color: isSubmitted ? Colors.green : Colors.pink,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AssignmentDetailPage(assignmentTitle: item['title']!),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
