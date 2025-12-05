import 'package:flutter/material.dart';

void main() {
  runApp(const BubbleSortApp());
}

class BubbleSortApp extends StatelessWidget {
  const BubbleSortApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bubble Sort UTS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const SortingPage(),
    );
  }
}

class SortingPage extends StatefulWidget {
  const SortingPage({super.key});

  @override
  State<SortingPage> createState() => _SortingPageState();
}

class _SortingPageState extends State<SortingPage> {
  final TextEditingController inputController = TextEditingController();
  List<int> numbers = [];
  List<int> sortedNumbers = [];

  void bubbleSort() {
    List<int> temp = List.from(numbers);

    for (int i = 0; i < temp.length - 1; i++) {
      for (int j = 0; j < temp.length - i - 1; j++) {
        if (temp[j] > temp[j + 1]) {
          int swap = temp[j];
          temp[j] = temp[j + 1];
          temp[j + 1] = swap;
        }
      }
    }

    setState(() {
      sortedNumbers = temp;
    });
  }

  void addNumber() {
    if (inputController.text.isEmpty) return;
    final value = int.tryParse(inputController.text);

    if (value != null) {
      setState(() {
        numbers.add(value);
        sortedNumbers.clear();
      });
      inputController.clear();
    }
  }

  void removeLast() {
    if (numbers.isNotEmpty) {
      setState(() {
        numbers.removeLast();
        sortedNumbers.clear();
      });
    }
  }

  void clearAll() {
    setState(() {
      numbers.clear();
      sortedNumbers.clear();
    });
  }

  Widget buildBubble(List<int> list, Color color) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: list
          .map(
            (e) => Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color, width: 1.6),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Text(
            e.toString(),
            style: TextStyle(
              fontSize: 18,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      )
          .toList(),
    );
  }

  Widget buildCard(String title, List<int> data, Color color) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          data.isEmpty
              ? Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Belum ada data",
                style: TextStyle(
                    fontSize: 16, color: Colors.grey.shade500),
              ),
            ),
          )
              : buildBubble(data, color),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // HEADER
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff4A77FF), Color(0xff6A9BFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          "Bubble Sort UTS",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // INPUT FIELD
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: inputController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Masukkan angka...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: addNumber,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Tambah", style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildCard("Data Original", numbers, Colors.indigo),
                    buildCard("Hasil Sort", sortedNumbers, Colors.green),
                  ],
                ),
              ),
            ),

            // BOTTOM ACTION BAR
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 12,
                      color: Colors.black.withOpacity(0.08),
                      offset: const Offset(0, -2))
                ],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.orange.shade600,
                    ),
                    onPressed: removeLast,
                    child: const Text("Hapus"),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.red.shade600,
                    ),
                    onPressed: clearAll,
                    child: const Text("Clear"),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                    ),
                    onPressed: bubbleSort,
                    child: const Text("Sort"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
