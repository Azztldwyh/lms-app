import 'package:flutter/material.dart';
import 'dart:async';

class QuizQuestionPage extends StatefulWidget {
  final String quizTitle;

  const QuizQuestionPage({super.key, required this.quizTitle});

  @override
  State<QuizQuestionPage> createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends State<QuizQuestionPage> {
  int _currentQuestionIndex = 0;
  int _secondsRemaining = 900; // 15 minutes
  Timer? _timer;
  
  // Mock questions
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Manakah dari berikut ini yang merupakan prinsip utama dari User Interface Design?',
      'options': ['Konsistensi', 'Kompleksitas', 'Abstraksi', 'Isolasi'],
      'selected': -1,
    },
    {
      'question': 'Apa tujuan utama dari pembuatan prototipe dalam proses desain UI/UX?',
      'options': ['Menambah biaya proyek', 'Menguji fungsionalitas sebelum pengembangan', 'Memperumit alur kerja', 'Menghindari umpan balik'],
      'selected': -1,
    },
    {
      'question': 'Elemen desain yang memberikan petunjuk visual tentang cara mengoperasikan suatu fitur disebut...',
      'options': ['Affordance', 'Signifiers', 'Constraints', 'Mapping'],
      'selected': -1,
    },
    // Add more mock questions as needed
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
          _submitQuiz();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _submitQuiz() {
    _timer?.cancel();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kirim Jawaban?'),
        content: const Text('Apakah Anda yakin ingin mengirim semua jawaban Anda sekarang?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Return to detail page
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Jawaban berhasil dikirim!'), backgroundColor: Colors.pink),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            child: const Text('Ya, Kirim', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quizTitle, style: const TextStyle(fontSize: 16)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.pink.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.timer_rounded, color: Colors.pink, size: 18),
                    const SizedBox(width: 5),
                    Text(
                      _formatTime(_secondsRemaining),
                      style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Question Navigation Bar
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                bool isCurrent = index == _currentQuestionIndex;
                bool isAnswered = _questions[index]['selected'] != -1;
                return GestureDetector(
                  onTap: () => setState(() => _currentQuestionIndex = index),
                  child: Container(
                    width: 40,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isCurrent 
                          ? Colors.pink 
                          : (isAnswered ? Colors.pink.withOpacity(0.2) : Colors.white),
                      border: Border.all(color: Colors.pink.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: isCurrent ? Colors.white : Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          const Divider(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pertanyaan:',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    currentQuestion['question'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.5),
                  ),
                  const SizedBox(height: 30),
                  
                  // Options
                  ...List.generate(
                    currentQuestion['options'].length,
                    (index) => _buildOptionCard(index, currentQuestion['options'][index]),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Navigation Buttons
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentQuestionIndex > 0)
                  _buildNavButton(Icons.arrow_back_ios_new_rounded, 'Sebelumnya', _previousQuestion, Colors.grey)
                else
                  const SizedBox(width: 40),

                if (_currentQuestionIndex == _questions.length - 1)
                  ElevatedButton(
                    onPressed: _submitQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Text('Kirim Jawaban', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                else
                  _buildNavButton(Icons.arrow_forward_ios_rounded, 'Selanjutnya', _nextQuestion, Colors.pink),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(int index, String text) {
    bool isSelected = _questions[_currentQuestionIndex]['selected'] == index;
    String label = String.fromCharCode(65 + index); // A, B, C, D

    return GestureDetector(
      onTap: () {
        setState(() {
          _questions[_currentQuestionIndex]['selected'] = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.pink : Colors.grey.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: isSelected ? Colors.pink : Colors.grey.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.pink : Colors.black87,
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle_rounded, color: Colors.pink),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(IconData icon, String label, VoidCallback onPressed, Color color) {
    bool isNext = label == 'Selanjutnya';
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(foregroundColor: color),
      child: Row(
        children: [
          if (!isNext) Icon(icon, size: 16),
          if (!isNext) const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          if (isNext) const SizedBox(width: 8),
          if (isNext) Icon(icon, size: 16),
        ],
      ),
    );
  }
}
