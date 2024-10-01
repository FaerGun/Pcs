class Gear{
  final String name;
  final String description;
  final String imageUrl;
  final int price;
  final String brand;
  final String flavor;

  Gear({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.brand,
    required this.flavor,
  });
}

List<Gear> gears = [
  Gear(
    name: 'Удилище Спиннинговое Major Craft Restive',
    description: 'Удилище обладает комфортной длинной для береговой джиговой ловли на средних и крупных реках. Также отлично подходит для ловли на колеблющиеся блёсны. При джиговой ловле в идеальных условиях начинает отстукивать с 10-ти грамм.',
    imageUrl: 'https://avatars.mds.yandex.net/get-mpic/3614670/img_id8709495867293679554.jpeg/x332_trim',
    price: 8600,
    brand: 'Major Craft Restive',
    flavor: 'Удилище',
  ),
  Gear(
    name: 'Сумка рыболовная TSURIBITO Superbag JPN 36*23*25cm, с держателями удилищ, серая',
    description: 'сумка Tsuribito для рыболовных аксессуаров в уникальном дизайне "треснутая земля" - яркий и функциональный атрибут профессионального рыбака.',
    imageUrl: 'https://main-cdn.sbermegamarket.ru/big2/hlr-system/203/047/558/333/119/3/600011418474b1.jpeg',
    price: 2900,
    brand: 'TSURIBITO',
    flavor: 'Сумка рыболовная',

  ),
  Gear(
    name: 'Катушка безынерционная Mifine с байтраннером SPEED',
    description: 'Mifine Speed - это семейство безынерционок, которые подойдут для установки на фидерные удилища.',
    imageUrl: 'https://avatars.mds.yandex.net/i?id=5c7e0cea0ebafce079e3bdbf605c4993_l-7663003-images-thumbs&n=13',
    price: 1600,
    brand: 'Mifine',
    flavor: 'Катушка',

  ),
  Gear(
    name: 'Леска плетеная DAIWA J-Braid X4 Yellow 135м',
    description: 'Высококлассный плетеный шнур отменного японского качества J-Braid X4 от фирмы Daiwa состоит из четырех волокон высококачественного полиэтилена, имеет очень плотное плетение и сечение, максимально приближенное к круглому.',
    imageUrl: 'https://cdn1.ozone.ru/s3/multimedia-i/6543987270.jpg',
    price: 900,
    brand: 'DAIWA',
    flavor: 'Леска плетеная',

  ),
  Gear(
    name: 'Воблер Bassday Sugar Deep Short Bill 75F',
    description: 'Инженеры Bassday разработали представленные модели для акваторий с неспешным течением, но приличной глубиной. Для успеха на меляках производители рекомендуют вести минноу так, чтобы он ударялся о дно.',
    imageUrl: 'https://avatars.mds.yandex.net/i?id=6341d76a546b8010e127b8e0b1212b8a7f2706d7-9541119-images-thumbs&n=13',
    price: 510,
    brand: 'Bassday Sugar Deep ',
    flavor: 'Воблеры',

  ),
  Gear(
    name: 'Приманка XXL Fish джиговая Флажок Модель № 2',
    description: 'Приманка Мандула "Флажок" XXL Fish Модель №2 Представляем вам новинку - приманку Мандула "Флажок" XXL Fish. Благодаря своей уловистости, приманка заинтересовала многих любителей рыбалки и получила широкую распространенность.',
    imageUrl: 'https://avatars.mds.yandex.net/get-mpic/5254781/2a0000018e596a0a07ad16b177c4271e3229/orig',
    price: 110,
    brand: 'XXL Fish',
    flavor: 'Приманочка',

  ),
  Gear(
    name: 'Надувная лодка Leader Тундра-380',
    description: 'Моторно-гребная лодка с НДНД. Модель представлена в двух размерах 325 мм и 380 мм.  Выполнена из ткани плотностью 750  гр. на кв.м.',
    imageUrl: 'https://avatars.mds.yandex.net/i?id=60a61ae10063417954ce9288a4e97949_l-4264709-images-thumbs&n=13',
    price: 49300,
    brand: 'Leader',
    flavor: 'Надувная лодка',

  ),
];