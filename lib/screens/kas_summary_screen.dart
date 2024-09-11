import 'package:flutter/material.dart';
import 'package:kas_personal/models/kas.dart';
import 'package:kas_personal/providers/kas_providers.dart';
import 'package:kas_personal/widgets/kas_item.dart';
import 'package:provider/provider.dart';

class KasSummaryScreen extends StatefulWidget {
  const KasSummaryScreen({super.key});

  @override
  State<KasSummaryScreen> createState() => _KasSummaryScreenState();
}

class _KasSummaryScreenState extends State<KasSummaryScreen> {
  void onItemTap(Kas kas) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kas Summary'),
      ),
      body: Consumer<KasProviders>(builder: (context, value, child) {
        final masukItems = value.masukItems;
        final keluarItems = value.keluarItems;
        final allItems = [...masukItems, ...keluarItems];

        final totalMasuk =
            masukItems.fold<double>(0, (sum, item) => sum + item.nominal);
        final totalKeluar =
            keluarItems.fold<double>(0, (sum, item) => sum + item.nominal);
        final totalTransactions = allItems.length;
        final totalBalance = totalMasuk - totalKeluar;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.deepPurple, // Sesuaikan border dengan referensi
                          width: 1, // Ukuran border sesuai referensi
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Total Transaksi',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                                                        totalTransactions.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Spacer between the containers
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.deepPurple, // Sesuaikan border dengan referensi
                          width: 1, // Ukuran border sesuai referensi
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Total Sisa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'IDR ${totalBalance.round()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: allItems.length,
                separatorBuilder: (context, index) => Divider(
                  height: 0,
                  color: Colors.grey.shade200,
                ),
                itemBuilder: (context, index) {
                  var kas = allItems[index];
                  return KasItem(
                    kas: kas,
                    onTap: () => onItemTap(kas),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}

class BaruDialog extends StatefulWidget {
  const BaruDialog({super.key, required this.onSimpan});

  final void Function(Kas kas) onSimpan;

  @override
  State<BaruDialog> createState() => _BaruDialogState();
}

class _BaruDialogState extends State<BaruDialog> {
  final nominalController = TextEditingController();
  final keteranganController = TextEditingController();

  void onSimpan() {
    double nominal = double.tryParse(nominalController.text) ?? 0;
    var kas = Kas.masuk(
      keterangan: keteranganController.text,
      nominal: nominal,
      dateTime: DateTime.now(),
    );
    widget.onSimpan(kas);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
