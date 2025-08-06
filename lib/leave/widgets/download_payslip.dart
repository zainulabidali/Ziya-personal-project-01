import 'package:flutter/material.dart';
import 'package:personal_app/leave/widgets/pdf.dart'; // <-- Your PDF generator
import 'package:printing/printing.dart';

class PrintPreviewScreen extends StatefulWidget {
  const PrintPreviewScreen({super.key});

  @override
  State<PrintPreviewScreen> createState() => _PrintPreviewScreenState();
}

class _PrintPreviewScreenState extends State<PrintPreviewScreen> {
  int _copies = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Preview", style: TextStyle(color: Colors.white)),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert,
                color: Color.fromARGB(255, 224, 219, 219)),
            onSelected: (value) async {
              if (value == 'save') {
                final pdfBytes = await generatePayslipPdf();
                await Printing.sharePdf(
                  bytes: pdfBytes,
                  filename: 'payslip.pdf',
                );
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'save',
                child: Text('Save as PDF'),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 170,
                height: 193,
                child: PdfPreview(
                  build: (format) => generatePayslipPdf(),
                  allowPrinting: false,
                  allowSharing: false,
                  canChangeOrientation: false,
                  canChangePageFormat: false,
                  pdfFileName: 'payslip.pdf',
                ),
              ),

              // Custom Print UI Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[800], // light gray background
                        borderRadius:
                            BorderRadius.circular(10), // rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: _row(
                        "Printer",
                        "Not selected",
                      ),
                    ),
                    const SizedBox(height: 10),
                    _copiesRow(),
                    const SizedBox(height: 10),
                    _optionRow("Direction", Icons.compare_arrows),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _optionBox("Pages", "All"),
                        const SizedBox(width: 10),
                        _optionBox("Color", "Colour"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _optionBox("Paper Size", "A4"),
                        const SizedBox(width: 10),
                        _optionBox("Print type", "Standard"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final pdfBytes = await generatePayslipPdf();
                        for (int i = 0; i < _copies; i++) {
                          await Printing.layoutPdf(
                            onLayout: (format) => Future.value(pdfBytes),
                          );
                        }
                      },
                      child: const Text(
                        "Print",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 45),
                        backgroundColor: const Color.fromARGB(255, 50, 51, 52),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(
    String label,
    String value,
  ) {
    return Row(
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const Spacer(),
        Text(value, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _copiesRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[800], // dark gray background
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Row(
        children: [
          // const Icon(Icons.copy, color: Colors.white),
          const SizedBox(width: 10),
          const Text("Copies", style: TextStyle(color: Colors.white)),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.remove_circle, color: Colors.white),
            onPressed: () {
              if (_copies > 1) setState(() => _copies--);
            },
          ),
          Text("$_copies", style: const TextStyle(color: Colors.white)),
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.white),
            onPressed: () {
              setState(() => _copies++);
            },
          ),
        ],
      ),
    );
  }

  Widget _optionRow(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[800], // Dark gray background
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Row(
        children: [
          // Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _optionBox(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 4),
            Text(value,
                style: const TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
