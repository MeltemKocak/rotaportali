// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'gonderi.dart';

class GonderiEklemeSayfasi extends StatefulWidget {
  final Function(Gonderi) onGonderiEkle;

  const GonderiEklemeSayfasi({super.key, required this.onGonderiEkle});

  @override
  _GonderiEklemeSayfasiState createState() => _GonderiEklemeSayfasiState();
}

class _GonderiEklemeSayfasiState extends State<GonderiEklemeSayfasi> {
  String? baslangicSehri;
  String? varisSehri;
  int? kilometre;
  String? aciklama;
  File? foto;

  Future<void> _fotoSec() async {
    final pickedFile =
    await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        foto = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> iller = [
      'Adana',
      'Adıyaman',
      'Afyonkarahisar',
      'Ağrı',
      'Amasya',
      'Ankara',
      'Antalya',
      'Artvin',
      'Aydın',
      'Balıkesir',
      'Bilecik',
      'Bingöl',
      'Bitlis',
      'Bolu',
      'Burdur',
      'Bursa',
      'Çanakkale',
      'Çankırı',
      'Çorum',
      'Denizli',
      'Diyarbakır',
      'Edirne',
      'Elazığ',
      'Erzincan',
      'Erzurum',
      'Eskişehir',
      'Gaziantep',
      'Giresun',
      'Gümüşhane',
      'Hakkâri',
      'Hatay',
      'Isparta',
      'Mersin',
      'İstanbul',
      'İzmir',
      'Kars',
      'Kastamonu',
      'Kayseri',
      'Kırklareli',
      'Kırşehir',
      'Kocaeli',
      'Konya',
      'Kütahya',
      'Malatya',
      'Manisa',
      'Kahramanmaraş',
      'Mardin',
      'Muğla',
      'Muş',
      'Nevşehir',
      'Niğde',
      'Ordu',
      'Rize',
      'Sakarya',
      'Samsun',
      'Siirt',
      'Sinop',
      'Sivas',
      'Tekirdağ',
      'Tokat',
      'Trabzon',
      'Tunceli',
      'Şanlıurfa',
      'Uşak',
      'Van',
      'Yozgat',
      'Zonguldak',
      'Aksaray',
      'Bayburt',
      'Karaman',
      'Kırıkkale',
      'Batman',
      'Şırnak',
      'Bartın',
      'Ardahan',
      'Iğdır',
      'Yalova',
      'Karabük',
      'Kilis',
      'Osmaniye',
      'Düzce',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gönderi Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButtonFormField<String>(
              value: baslangicSehri,
              onChanged: (value) {
                setState(() {
                  baslangicSehri = value;
                });
              },
              items: iller.map((String il) {
                return DropdownMenuItem<String>(
                  value: il,
                  child: Text(il),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Başlangıç Şehri',
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: varisSehri,
              onChanged: (value) {
                setState(() {
                  varisSehri = value;
                });
              },
              items: iller.map((String il) {
                return DropdownMenuItem<String>(
                  value: il,
                  child: Text(il),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Varış Şehri',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Kilometre',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  kilometre = int.tryParse(value);
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Açıklama',
              ),
              onChanged: (value) {
                setState(() {
                  aciklama = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _fotoSec,
              child: const Text('Fotoğraf Seç'),
            ),
            const SizedBox(height: 16.0),
            if (foto != null)
              Container(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.file(
                  foto!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
              ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (baslangicSehri != null &&
                    varisSehri != null &&
                    kilometre != null &&
                    aciklama != null &&
                    foto != null) {
                  Gonderi yeniGonderi = Gonderi(
                    baslik: '$baslangicSehri - $varisSehri',
                    aciklama: aciklama!,
                    kilometre: kilometre!,
                    foto: foto,
                  );
                  widget.onGonderiEkle(yeniGonderi);
                  Navigator.pop(context);
                }
              },
              child: const Text('Rota Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
