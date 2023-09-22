import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:intl/intl.dart';

class Payslip extends StatefulWidget {
  final String employeeId; // Add this field

  const Payslip({
    Key? key,
    required this.employeeId, // Pass the employeeId to the constructor
  }) : super(key: key);

  @override
  _PayslipState createState() => _PayslipState();
}

class _PayslipState extends State<Payslip> {
  String pdfPath = "";

  Future<void> fetchDataAndGeneratePdf() async {
    final apiUrl =
        'http://198.154.112.5/PEApi/api/GetPayslip/741258?Period=2023-06-25&EmployeeId=${widget.employeeId}';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IlBDTU4vMDA3MCIsIm5iZiI6MTY5NTMwOTQ4NywiZXhwIjoxNjk3OTAxNDg3LCJpYXQiOjE2OTUzMDk0ODd9.VZJ-nxs3h3dBVeDqHQLRdj0I49ysMaayl5dD2oAAT_c', // Replace with your bearer token
        },
      );

      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        final data = userData['data'];

        final earnings = data['earnings'];
        final deductions = data['deductions'];

        final companyId = data['companyId'];
        final grossPay = data['grossPay'];
        final employeeId = data['employeeId'];
        final netEarnings = data['netEarnings'];
        final totalDeductions = data['totalDeductions'];
        final currencyID = data['currencyID'];
        final amount = earnings[0]['amount'];
        final amount1 = earnings[1]['amount'];
        final period = data['period'];
        final payTypeId = earnings[0]['payTypeId'];
        final payTypeId2 = earnings[1]['payTypeId'];
        final deduction = deductions[0]['amount'];
        final payTypeBalancededuction = deductions[0]['payTypeBalance'];
        final payTypeDescription = deductions[0]['payTypeDescription'];
        final payTypeIdD = deductions[1]['payTypeId'];
        final amountT = deductions[1]['amount'];

        final numberFormat = NumberFormat('#,###.##');

        final formattedGrossPay = numberFormat.format(grossPay);
        final formattedNetEarnings = numberFormat.format(netEarnings);
        final formattedTotalDeductions = numberFormat.format(totalDeductions);
        final formattedAmount = numberFormat.format(amount);
        final formattedAmount1 = numberFormat.format(amount1);
        final formattedDeduction = numberFormat.format(deduction);
        final formattedAmountT = numberFormat.format(amountT);
        final formattedPayTypeBalancededuction =
            numberFormat.format(payTypeBalancededuction);

        final pdf = pw.Document();
        pdf.addPage(
          pw.Page(
            build: (pw.Context context) {
              return pw.Stack(
                children: [
                  pw.Container(
                    height: 1000,
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 50),
                    child: pw.Text('Employee ID: $employeeId',
                        style: pw.TextStyle(fontSize: 25)),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 80),
                    child: pw.Text('Company ID: $companyId',
                        style: pw.TextStyle(fontSize: 25)),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 150),
                    child:
                        pw.Text('Earnings', style: pw.TextStyle(fontSize: 45)),
                  ),
                  pw.Container(
                    child: pw.Text('Pay period: $period',
                        style: pw.TextStyle(
                            fontSize: 31, fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 250),
                    child: pw.Text('$payTypeId:',
                        style: pw.TextStyle(fontSize: 25)),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 250, left: 350),
                    child: pw.Text(' $formattedAmount',
                        style: pw.TextStyle(fontSize: 25)),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 210, left: 350),
                    child: pw.Text(' $formattedAmount1',
                        style: pw.TextStyle(fontSize: 25)),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 210),
                    child: pw.Text('$payTypeId2:',
                        style: pw.TextStyle(fontSize: 25)),
                  ),
                  pw.Container(
                      height: 5,
                      margin: pw.EdgeInsets.only(top: 200),
                      color: PdfColors.black),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 330),
                    child: pw.Text('Deductions',
                        style: pw.TextStyle(
                          fontSize: 45,
                        )),
                  ),
                  pw.Container(
                      height: 5,
                      margin: pw.EdgeInsets.only(top: 380),
                      color: PdfColors.black),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 390),
                    child: pw.Text('$payTypeDescription:',
                        style: pw.TextStyle(fontSize: 25)),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 390, left: 350),
                    child: pw.Text('$formattedDeduction',
                        style: pw.TextStyle(fontSize: 25)),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 430),
                    child: pw.Text('$payTypeIdD:',
                        style: pw.TextStyle(fontSize: 25)),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 430, left: 350),
                    child: pw.Text('$formattedAmountT',
                        style: pw.TextStyle(fontSize: 25)),
                  ),
                  pw.Container(
                      height: 5,
                      margin: pw.EdgeInsets.only(top: 500),
                      color: PdfColors.black),
                  pw.Container(
                      height: 3,
                      margin: pw.EdgeInsets.only(top: 590),
                      color: PdfColors.black),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 520),
                    child: pw.Text('Gross Pay:',
                        style: pw.TextStyle(
                            fontSize: 26, fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Container(
                      margin: pw.EdgeInsets.only(top: 520, left: 350),
                      child: pw.Text('$formattedGrossPay',
                          style: pw.TextStyle(fontSize: 26))),
                  pw.Container(
                      margin: pw.EdgeInsets.only(top: 560),
                      child: pw.Text('Total Deductions :',
                          style: pw.TextStyle(
                              fontSize: 26, fontWeight: pw.FontWeight.bold))),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 560, left: 350),
                    child: pw.Text('$formattedTotalDeductions',
                        style: pw.TextStyle(fontSize: 26)),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 600),
                    child: pw.Text('Net Earnings:',
                        style: pw.TextStyle(
                            fontSize: 26, fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 600, left: 350),
                    child: pw.Text('$formattedNetEarnings ',
                        style: pw.TextStyle(
                            fontSize: 26, fontWeight: pw.FontWeight.bold)),
                  ),
                ],
              );
            },
          ),
        );

        final output = await getExternalStorageDirectory();
        if (output != null) {
          final file = File("${output.path}/payslip.pdf");
          await file.writeAsBytes(await pdf.save());
          setState(() {
            pdfPath = file.path;
          });
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Payslip Not Available')));
        }
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  Future<void> sharePdf() async {
    if (pdfPath.isNotEmpty) {
      await Share.shareFiles([pdfPath]);
    } else {
      print("PDF not generated yet.");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataAndGeneratePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payslip"),
        backgroundColor: Color.fromARGB(255, 45, 175, 229),
      ),
      body: pdfPath.isNotEmpty
          ? PDFView(filePath: pdfPath)
          : Center(
              child: Text("Generating PDF..."),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: sharePdf,
        child: Icon(Icons.share_outlined),
        backgroundColor: Color.fromARGB(255, 45, 175, 229),
      ),
    );
  }
}
