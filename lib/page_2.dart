import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'library_model.dart';
class DetailsScreen extends StatelessWidget {

  static const double defaultPadding = 12.0;
  static const double defaultBorderRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Color(0xFF496282),
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white54,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/images/seker_p.jpeg",
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text( "Şeker Portakalı Kısa Özet",
                         // product.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      "Brezilyalı yazar Jose Mauro de Vasconcelos’un 1968’de yayımlanan Şeker Portakalı adlı eseri, yalın anlatımı ve çarpıcı hikâyesiyle dünya edebiyatının unutulmaz başyapıtları arasında yer alıyor. Yazarının hayatından izler taşıyan eser, bir çocuğun iç dünyasından yola çıkarak tüm insanlığa acıyla yoğrularak olgunlaşmanın ağırlığını duyumsatıyor.",
                    ),
                  ),
                  Text(
                    "Jose Mauro De Vasconcelos",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),

                  const SizedBox(height: defaultPadding * 2),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            shape: const StadiumBorder()),
                        child: const Text("Sepete ekle"),
                      ),
                    ),
                  )
                ],
              ),
            ),

          )
        ],
      ),
    );
  }
}