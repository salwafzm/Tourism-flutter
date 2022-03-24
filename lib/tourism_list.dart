import 'package:flutter/material.dart';
import 'package:flutter_layout/model/tourism_place.dart';
import 'package:flutter_layout/detail_screen.dart';
import 'package:flutter_layout/list_item.dart';
import 'package:flutter_layout/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

class TourismList extends StatefulWidget{
  const TourismList({Key? key}) : super(key: key);
  @override
  _TourismListState createState() => _TourismListState();
}

class _TourismListState extends State<TourismList>{
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
      name: 'Surabaya Submarine Monument',
      location: 'Jl Pemuda',
      imageAsset: 'assets/images/monkasel.jpg',
      description: 'Monumen Kapal Selam atau disingkat Monkasel merupakan sebuah monumen yang dibangun menggunakan kapal selam asli. '
          'Data Dinas Pariwisata Jawa Timur mencatat Monumen Kapal Selam dibuat dari kapal selam KRI Pasopati 410. '
          'Salah satu kapal selam milik armada Angkatan Laut Republik Indonesia buatan Uni Soviet tahun 1952.',
      time: '08.00 - 16.00',
      day: 'Open Everyday',
      price: '15.000',
      img1: 'assets/images/monkasel1.jpg',
      img2: 'assets/images/monkasel2.jpg',
    ),
    TourismPlace(
      name: 'Kelenteng Sanggar Agung',
      location: 'Kenjeran',
      imageAsset: 'assets/images/kelenteng.jpg',
      description: 'Kelenteng Sanggar Agung atau Klenteng Hong San Tang adalah sebuah klenteng di Kota Surabaya. '
          'Kuil ini, selain menjadi tempat ibadah bagi pemeluk Tridharma, juga menjadi tempat tujuan wisata.',
      time: '07.00 - 20.00',
      day: 'Open Everyday',
      price: '5.000 - 10.000',
      img1: 'assets/images/kelenteng1.jpg',
      img2: 'assets/images/kelenteng2.jpg',
    ),
    TourismPlace(
      name: 'House of Sampoerna',
      location: 'Krembangan Utara',
      imageAsset: 'assets/images/sampoerna.jpg',
      description: 'House of Sampoerna adalah sebuah museum tembakau dan markas besar Sampoerna yang terletak di Surabaya. '
          'Gaya arsitektur dari bangunan utamanya yang dipengaruhi oleh gaya kolonial Belanda dibangun pada 1862 dan '
          'sekarang menjadi situs sejarah.',
      time: '09.00 - 18.00',
      day: 'Open Everyday',
      price: 'Free',
      img1: 'assets/images/sampoerna1.jpg',
      img2: 'assets/images/sampoerna2.jpg',
    ),
    TourismPlace(
      name: 'Tugu Pahlawan',
      location: 'Alun-Alun Contong',
      imageAsset: 'assets/images/tugu.jpg',
      description: 'Tugu Pahlawan adalah sebuah monumen yang menjadi markah tanah Kota Surabaya. Monumen ini berbentuk lingga atau paku terbalik. '
          'Tinggi, ruas dan canalures mengandung makna tanggal 10, bulan 11, tahun 1945. ',
      time: '08.00- 16.00',
      day: 'Senin - Jumat',
      price: '5.000',
      img1: 'assets/images/tugu1.jpg',
      img2: 'assets/images/tugu2.jpg',
    ),
    TourismPlace(
      name: 'Patung Suro Boyo',
      location: 'Wonokromo',
      imageAsset: 'assets/images/patungsby.jpg',
      description: 'Patung Suro Boyo adalah sebuah patung yang merupakan lambang kota Surabaya. Patung ini berada di depan '
          'Kebun Binatang Surabaya. Patung ini terdiri atas dua hewan ini yang menjadi inspirasi nama kota '
          'Surabaya, yaitu ikan sura (hiu) dan baya (buaya).',
      time: '24 jam',
      day: 'Open Everyday',
      price: 'Free',
      img1: 'assets/images/patungsby1.jpg',
      img2: 'assets/images/patungsby2.jpg',
    ),
    TourismPlace(
      name: 'Kebun Binatang Surabaya',
      location: 'Wonokromo',
      imageAsset: 'assets/images/kbs.jpg',
      description: 'Kebun Binatang Surabaya (KBS)adalah salah satu kebun binatang yang populer di Indonesia dan terletak di Surabaya. '
          'KBS merupakan kebun binatang yang pernah terlengkap se-Asia Tenggara, di dalamnya terdapat lebih dari 211 spesies '
          'satwa yang berbeda yang terdiri lebih dari 2.236 binatang. Termasuk di dalamnya satwa langka Indonesia maupun dunia.',
      time: '08.00 - 16.00',
      day: 'Open Everyday',
      price: '15.000',
      img1: 'assets/images/kbs1.jpg',
      img2: 'assets/images/kbs2.jpg',
    ),
    TourismPlace(
      name: 'Masjid Nasional Al-Akbar Surabaya',
      location: 'Jambangan',
      imageAsset: 'assets/images/masjid.jpg',
      description: 'Masjid Nasional Al-Akbar (atau biasa disebut Masjid Agung Surabaya) ialah masjid terbesar kedua di Indonesia '
          'setelah Masjid Istiqlal di Jakarta. Ciri yang mudah dilihat adalah kubahnya yang besar didampingi 4 kubah kecil '
          'yang berwarna biru. Serta memiliki satu menara yang tingginya 99 meter.',
      time: '24 jam',
      day: 'Open Everyday',
      price: 'Free',
      img1: 'assets/images/masjid1.jpg',
      img2: 'assets/images/masjid2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(place: place);
            }));
          },
          child: Consumer<DoneTourismProvider>(
            builder: (context, DoneTourismProvider data, widget){
              return ListItem(
                place: place,
                isDone: data.doneTourismPlaceList.contains(place),
                onCheckboxClick: (bool? value){
                  setState(() {
                    if(value!=null) {
                      value
                          ? data.doneTourismPlaceList.add(place)
                          : data.doneTourismPlaceList.remove(place);
                    }
                  });
                },
              );
            },
          ),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}