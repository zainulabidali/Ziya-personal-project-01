import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

Future<Uint8List> generatePayslipPdf() async {
  final pdf = pw.Document();

  final logoImage = pw.MemoryImage(
    (await rootBundle.load('assets/img/ziya_logo-removebg-preview.png')).buffer.asUint8List(),
  );

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(16),
      build: (pw.Context context) {
        return pw.Stack(
          children: [
            pw.Positioned.fill(
              child: pw.Opacity(
                opacity: 0.05,
                child: pw.Center(
                  child: pw.Image(logoImage, width: 150, height: 150),
                ),
              ),
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    // 👉 Logo (left side)
                    pw.Image(
                      logoImage, // pw.MemoryImage or pw.RawImage
                      width: 50,
                      height: 50,
                    ),

               
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Ziya Academy",
                          style: pw.TextStyle(
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.blue,
                          ),
                        ),
                        pw.Text(
                          "Key To Success",
                          style: pw.TextStyle(
                            fontSize: 14,
                            color: PdfColors.green,
                          ),
                        ),
                      ],
                    ),

                    // 👉 Right Side Payslip Info
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          "Payslip for month",
                          style: pw.TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        pw.Text(
                          "June 2025",
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  "Employee Summary",
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 6),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // 🔹 Left Side: Employee Summary
                    pw.Expanded(
                      flex: 2,
                      child: pw.Container(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Employee Name: Abid"),
                            pw.Text("Designation: Flutter Developer"),
                            pw.Text("Employee ID: ZA1234"),
                            pw.Text("Date of Joining: 15/07/2025"),
                            pw.Text("Pay Period: July 2025"),
                            pw.Text("Pay Date: 15/07/2025"),
                          ],
                        ),
                      ),
                    ),

                    pw.SizedBox(width: 10),

                    // 🔹 Right Side: Net Pay Container
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        padding: const pw.EdgeInsets.all(8),
                        decoration: pw.BoxDecoration(
                          color: PdfColors.green100,
                          borderRadius: pw.BorderRadius.circular(8),
                        ),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("₹ 45000",
                                style: pw.TextStyle(
                                    fontSize: 16,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text("Employee Net Pay",
                                style: pw.TextStyle(fontSize: 10)),
                            pw.Divider(),
                            pw.Text("Paid Days: 31",
                                style: pw.TextStyle(fontSize: 12)),
                            pw.Text("LOP Days: 0",
                                style: pw.TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("PF A/C Number  : AA/AAA/9999"),
                      pw.Text("UAN  : 1111111111"),
                    ]),
                pw.SizedBox(height: 10),
                pw.Container(
                  decoration: pw.BoxDecoration(
                    color: PdfColors.white,
                    borderRadius: pw.BorderRadius.circular(12),
                    border: pw.Border.all(
                        color: PdfColor.fromInt(0xFF4D4C4C), width: 0.5),
                  ),
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                    children: [
                      // Custom Table Header
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(vertical: 6),
                        child: pw.Row(
                          children: [
                            for (final header in [
                              "Earnings",
                              "Amount",
                              "YTD",
                              "Deductions",
                              "Amount",
                              "YTD"
                            ])
                              pw.Expanded(
                                flex: header == "Earnings" ||
                                        header == "Deductions"
                                    ? 2
                                    : 1,
                                child: pw.Text(
                                  header,
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ),
                          ],
                        ),
                      ),

                      pw.Divider(color: PdfColors.grey300, thickness: 0.5),

                      // Custom Table Rows
                      ...[
                        [
                          "Basic",
                          "₹ 25000",
                          "₹ 300000",
                          "PF Deduction",
                          "₹ 2500",
                          "₹ 30000"
                        ],
                        [
                          "HRA",
                          "₹ 10000",
                          "₹ 120000",
                          "Tax Deduction",
                          "₹ 7500",
                          "₹ 90000"
                        ],
                        [
                          "Travel Allowance",
                          "₹ 3000",
                          "₹ 36000",
                          "",
                          "₹ 0",
                          "₹ 0"
                        ],
                        [
                          "Meal / Other Allowance",
                          "₹ 2000",
                          "₹ 24000",
                          "",
                          "₹ 0",
                          "₹ 0"
                        ],
                      ].map(
                        (row) => pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4),
                          child: pw.Row(
                            children: [
                              for (int i = 0; i < row.length; i++)
                                pw.Expanded(
                                  flex: i == 0 || i == 3 ? 2 : 1,
                                  child: pw.Text(
                                    row[i],
                                    style: const pw.TextStyle(fontSize: 10),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),

                      pw.SizedBox(height: 8),

                      // Summary Row
                      pw.Container(
                        decoration: pw.BoxDecoration(
                          color: PdfColor.fromInt(0xCFD4EBF7),
                          borderRadius: pw.BorderRadius.circular(5),
                        ),
                        padding: const pw.EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text("Gross Earnings ₹ 55000",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 12)),
                            pw.Text("Total Deductions ₹ 10000",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.SizedBox(height: 10),
                pw.Container(
                  width: double.infinity,
                  padding: const pw.EdgeInsets.all(8),
                  decoration: pw.BoxDecoration(
                    color: PdfColors.white,
                    border: pw.Border.all(color: PdfColors.grey300),
                    borderRadius: pw.BorderRadius.circular(8),
                  ),
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              "Total Net Payable",
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.SizedBox(height: 4),
                            pw.Text(
                              "Gross Earnings - Total Deductions",
                              style: pw.TextStyle(
                                fontSize: 10, 
                                color: PdfColors.grey600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        decoration: pw.BoxDecoration(
                          color: PdfColors.green100,
                          borderRadius: pw.BorderRadius.circular(6),
                        ),
                        child: pw.Text(
                          "₹ 45000",
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ),
  );

  return pdf.save();
}
