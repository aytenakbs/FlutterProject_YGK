import 'package:flutter/material.dart';
import 'package:ygk_project/constants/colors.dart';
import 'package:ygk_project/models/informingText.dart';
import 'package:ygk_project/widgets/informingCard.dart';

class InformingPage extends StatelessWidget {
  const InformingPage({Key? key}) : super(key: key);

  // Her kart için ayrı metin ve görsel yolu.
  final List<InformingText> informingDataList = const [
    InformingText(
      text: "Su kaynaklarımız sınırlıdır ve su tasarrufu yaparak çevreye önemli bir katkı sağlayabiliriz. Basit adımlarla suyun daha verimli kullanılmasını sağlayarak, hem doğaya hem de ekonomiye fayda sağlayabiliriz.",
      bulletPoints: [
        'Diş fırçalarken musluğu kapatın.',
        'Duş sürelerini kısaltın.',
        'Bulaşık ve çamaşır makinelerini tamamen dolmadan çalıştırmayın.',
        'Bahçe sulamasını sabah erken veya akşam geç saatlerde yaparak buharlaşmayı en aza indirin.',
        'Kapanmayan muslukları ve sızdıran tesisatları onarın.',
        'Gri suyu yeniden kullanma sistemleri (duş/bulaşık suyu ile tuvaletleri yıkamak) kullanın.',
      ],
      imagePath: 'lib/assets/images/drop-1066410_1920.jpg',
    ),

    InformingText(
      text: "Enerji kullanımını azaltmak hem karbon ayak izimizi düşürür hem de fosil yakıtlara olan bağımlılığı azaltarak sürdürülebilir bir geleceğe katkı sağlar.",
      bulletPoints: [
        'Gereksiz yere yanan ışıkları kapatın.',
        'Elektronik cihazları kullanmadığınızda prizden çekin.',
        'Enerji tasarruflu ampuller (LED) kullanın.',
        'Buzdolabı gibi sürekli çalışan cihazların kapaklarını uzun süre açık bırakmayın.',
        'Isıtma ve soğutma cihazlarını verimli kullanın; oda sıcaklığını optimum seviyede tutun.',
        'Güneş enerjisinden yararlanmayı değerlendirin.',
      ],
      imagePath: 'lib/assets/images/light-bulbs-1125016_1920.jpg',
    ),

    InformingText(
      text: "Geri dönüşüm, atıkların yeniden kullanılması ve üretim döngüsüne geri kazandırılması anlamına gelir. Aynı zamanda atıkların en aza indirilmesi çevreye verilen zararı büyük ölçüde azaltır.",
      bulletPoints: [
        'Plastik, kağıt, cam ve metal gibi malzemeleri geri dönüşüm kutularına ayırarak atın.',
        'Tek kullanımlık plastik ürünlerden kaçının.',
        'Yeniden kullanılabilir alışveriş torbaları, su şişeleri ve kahve termosları kullanın.',
        'Yiyecek alışverişi yaparken fazla ambalajlanmış ürünlerden kaçının.',
        'Eski kıyafetleri bağışlayın veya geri dönüşüm merkezlerine gönderin.',
        'Organik atıkları kompost yaparak gübreye dönüştürün.',
      ],
      imagePath: 'lib/assets/images/home-8061674_1920.jpg',
    ),

    InformingText(
      text: "Karbon ayak izi, günlük hayatımızda fosil yakıtlara dayalı faaliyetler sonucunda atmosfere salınan karbondioksit miktarını ifade eder. Bunu azaltmak, sürdürülebilir bir gelecek için önemli bir adımdır.",
      bulletPoints: [
        'Kısa mesafelerde yürüyün veya bisiklete binin.',
        'Toplu taşıma araçlarını kullanın veya araç paylaşımı uygulamalarını tercih edin.',
        'Araç satın alırken yakıt verimliliği yüksek modelleri seçin veya elektrikli araçları değerlendirin.',
        'Yerel ve mevsimlik gıdalar tüketerek karbon salınımını azaltın.',
        'Uçak seyahatlerinizi azaltın ve mümkünse tren gibi daha çevre dostu ulaşım yöntemlerini tercih edin.',
      ],
      imagePath: 'lib/assets/images/world-6658881_1920.jpg',
    ),

    InformingText(
      text: "Gıda israfı, hem ekonomik kayba neden olur hem de çevre üzerinde büyük bir baskı oluşturur. Doğru alışkanlıklarla bu israfı önlemek mümkündür.",
      bulletPoints: [
        'Yemek planları yaparak ihtiyacınız kadar gıda satın alın.',
        'Artan yiyecekleri saklama ve yeniden değerlendirme yollarını araştırın.',
        'Son kullanma tarihi yaklaşan gıdaları öne alın ve önce bunları tüketin.',
        'Bozulmaya yatkın gıdaları uygun koşullarda saklayın.',
        'Atık gıdaları kompost yaparak organik gübreye dönüştürün.',
        'Porsiyonlarınızı kontrol edin; tabaklarda fazla yemek bırakmayın.',
      ],
      imagePath: 'lib/assets/images/food-8294133_1920.jpg',
    ),

    InformingText(
      text: "Doğal kaynakları daha bilinçli kullanarak çevresel sürdürülebilirliğe büyük katkı sağlanabilir. Bu, hem bireysel farkındalık hem de doğayla uyumlu yaşam tarzları gerektirir.",
      bulletPoints: [
        'Doğal temizlik ürünleri kullanarak kimyasal kirlenmeyi azaltın.',
        'İhtiyaç fazlası kâğıt kullanımını azaltın.',
        'Yerli bitkiler ekerek su ve gübre ihtiyacını azaltın.',
        'Plastik poşetler yerine bez veya geri dönüştürülebilir torbalar tercih edin.',
        'Sürdürülebilir ve çevre dostu sertifikalara sahip ürünleri satın alın.',
        'Elektronik atıkları uygun şekilde geri dönüştürme merkezlerine gönderin.',
      ],
      imagePath: 'lib/assets/images/rice-8004280_1920.jpg',
    ),

    InformingText(
      text: "Sürdürülebilir moda, giyim alışverişlerinde bilinçli tercihler yaparak doğaya daha az zarar verilmesini sağlar.",
      bulletPoints: [
        'Hızlı modadan kaçının; uzun ömürlü, kaliteli ürünler satın alın.',
        'İkinci el kıyafet alışverişi yapın.',
        'Kıyafetlerinizi daha uzun süre kullanmak için tamir edin veya yeniden değerlendirin.',
        'Sürdürülebilir moda markalarından alışveriş yapın.',
        'Giyim alışverişinde minimalist bir yaklaşım benimseyin.',
      ],
      imagePath: 'lib/assets/images/textile-363282_1920.jpg',
    ),

    InformingText(
      text: "Sürdürülebilirliği bireysel olarak uygularken, bu bilinci toplumda da yaygınlaştırmak oldukça önemlidir.",
      bulletPoints: [
        'Gönüllü olarak çevre temizliği projelerine katılın.',
        'Geri dönüşüm, enerji ve su tasarrufu gibi konularda çevrenizi bilinçlendirin.',
        'Yerel veya ulusal çevre kampanyalarına destek verin.',
        'Sürdürülebilirlik eğitimi veren programlara katılın veya çevrenizdeki insanları teşvik edin.',
        'Yerel çiftliklerden veya çevre dostu girişimlerden ürün satın alarak yerel ekonomiye katkı sağlayın.',
      ],
      imagePath: 'lib/assets/images/volunteer-2654003_1920.jpg',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor:AppColors.whiteColor,
        title: const Text('    Neler Yapabilirim',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: AppColors.darkGrayColor),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ),
      body: SingleChildScrollView(

        child: Column(
          children: informingDataList.map((data) {
            return InformingCard(
              text: data.text,
              bulletPoints: data.bulletPoints,
              imagePath: data.imagePath,
              opacityValue: 0.5,
            );
          }).toList(),
        ),
      ),
    );
  }
}
