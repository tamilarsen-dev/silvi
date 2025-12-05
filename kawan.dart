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
      title: "Bubble Sort",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      ),
      home: const BubbleSortPage(),
    );
  }
}

class BubbleSortPage extends StatefulWidget {
  const BubbleSortPage({super.key});

  @override
  State<BubbleSortPage> createState() => _BubbleSortPageState();
}

class _BubbleSortPageState extends State<BubbleSortPage> {
  List<int> numbers = [];
  List<int> sortedNumbers = [];
  final TextEditingController controller = TextEditingController();

  void addNumber() {
    final v = int.tryParse(controller.text);
    if (v != null) {
      setState(() {
        numbers.add(v);
        sortedNumbers.clear(); // reset hasil sort
      });
      controller.clear();
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

  void bubbleSort() {
    if (numbers.isEmpty) return;
    List<int> temp = List.from(numbers);

    for (int i = 0; i < temp.length - 1; i++) {
      for (int j = 0; j < temp.length - i - 1; j++) {
        if (temp[j] > temp[j + 1]) {
          int t = temp[j];
          temp[j] = temp[j + 1];
          temp[j + 1] = t;
        }
      }
    }

    setState(() {
      sortedNumbers = temp;
    });
  }

  Widget dataContainer({
    required String title,
    required List<int> list,
    required Color borderColor,
    required Color bubbleColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: bubbleColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: borderColor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          list.isEmpty
              ? Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Belum ada data",
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
          )
              : Wrap(
            spacing: 10,
            runSpacing: 10,
            children: list
                .map(
                  (e) => Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: bubbleColor.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Text(
                  e.toString(),
                  style: TextStyle(
                    color: borderColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bubble Sort"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // INPUT FIELD
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Masukkan angka",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // TOMBOL DI ATAS CONTAINER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton.tonal(
                  onPressed: addNumber,
                  child: const Text("Tambah"),
                ),
                FilledButton.tonal(
                  onPressed: removeLast,
                  child: const Text("Hapus"),
                ),
                FilledButton.tonal(
                  onPressed: clearAll,
                  child: const Text("Clear"),
                ),
                FilledButton(
                  onPressed: bubbleSort,
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text("Sort"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // CONTAINER DATA ORIGINAL
            dataContainer(
              title: "Data Belum Terurut",
              list: numbers,
              borderColor: Colors.purple,
              bubbleColor: Colors.purple.shade100,
            ),

            // CONTAINER DATA TERURUT
            dataContainer(
              title: "Data Setelah Sort",
              list: sortedNumbers,
              borderColor: Colors.deepPurple,
              bubbleColor: Colors.deepPurple.shade100,
            ),
          ],
        ),
      ),
    );
  }
}
