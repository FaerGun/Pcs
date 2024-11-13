from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

app = FastAPI()
origins = [
    "*"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class SProduct(BaseModel):
    ID: int
    Image_URL: str
    Name: str
    Description: str
    Price: float


products = [
    {"ID": 1, "ImageURL": "https://avatars.mds.yandex.net/get-mpic/3614670/img_id8709495867293679554.jpeg/x332_trim", "Name": "Удилище Спиннинговое Major Craft Restive", "Description": "Удилище обладает комфортной длинной для береговой джиговой ловли на средних и крупных реках. Также отлично подходит для ловли на колеблющиеся блёсны. При джиговой ловле в идеальных условиях начинает отстукивать с 10-ти грамм.", "Price": 8600},
	{"ID": 2, "ImageURL": "https://main-cdn.sbermegamarket.ru/big2/hlr-system/203/047/558/333/119/3/600011418474b1.jpeg", "Name": "Сумка рыболовная TSURIBITO Superbag JPN 36*23*25cm, с держателями удилищ, серая", "Description": "сумка Tsuribito для рыболовных аксессуаров в уникальном дизайне треснутая земля - яркий и функциональный атрибут профессионального рыбака.", "Price": 2900},
	{"ID": 3, "ImageURL": "https://avatars.mds.yandex.net/i?id=5c7e0cea0ebafce079e3bdbf605c4993_l-7663003-images-thumbs&n=13", "Name": "Катушка безынерционная Mifine с байтраннером SPEED", "Description": "Mifine Speed - это семейство безынерционок, которые подойдут для установки на фидерные удилища.", "Price": 1600},
	{"ID": 4, "ImageURL": "https://cdn1.ozone.ru/s3/multimedia-i/6543987270.jpg", "Name": "Леска плетеная DAIWA J-Braid X4 Yellow 135м", "Description": "Высококлассный плетеный шнур отменного японского качества J-Braid X4 от фирмы Daiwa состоит из четырех волокон высококачественного полиэтилена, имеет очень плотное плетение и сечение, максимально приближенное к круглому.", "Price": 900},
	{"ID": 5, "ImageURL": "https://avatars.mds.yandex.net/i?id=6341d76a546b8010e127b8e0b1212b8a7f2706d7-9541119-images-thumbs&n=13", "Name": "Воблер Bassday Sugar Deep Short Bill 75F", "Description": "Инженеры Bassday разработали представленные модели для акваторий с неспешным течением, но приличной глубиной. Для успеха на меляках производители рекомендуют вести минноу так, чтобы он ударялся о дно.", "Price": 510},
	{"ID": 6, "ImageURL": "https://avatars.mds.yandex.net/get-mpic/5254781/2a0000018e596a0a07ad16b177c4271e3229/orig", "Name": "Приманка XXL Fish джиговая Флажок Модель № 2 ", "Description": "Приманка Мандула Флажок XXL Fish Модель №2 Представляем вам новинку - приманку Мандула Флажок XXL Fish. Благодаря своей уловистости, приманка заинтересовала многих любителей рыбалки и получила широкую распространенность.", "Price": 110},
	{"ID": 7, "ImageURL": "https://avatars.mds.yandex.net/i?id=60a61ae10063417954ce9288a4e97949_l-4264709-images-thumbs&n=13", "Name": "Надувная лодка Leader Тундра-380", "Description": "Моторно-гребная лодка с НДНД. Модель представлена в двух размерах 325 мм и 380 мм.  Выполнена из ткани плотностью 750  гр. на кв.м.", "Price": 49300},
]


@app.get('/products')
def get_products():
    return products


@app.post('/products/create')
def create_product(product: SProduct):
    products.append(product)
    return product


@app.get('/products/{product_id}')
def get_product(product_id: int):
    for product in products:
        if product['ID'] == product_id:
            return product
    return {'error': 'Product not found'}


@app.delete('/products/{product_id}')
def delete_product(product_id: int):
    for product in products:
        if product['ID'] == product_id:
            products.remove(product)
            return {'message': 'Product deleted'}
    return {'error': 'Product not found'}


@app.put('/products/{product_id}')
def update_product(product_id: int, product: SProduct):
    for i in range(len(products)):
        if products[i]['ID'] == product_id:
            products[i] = product.dict()
            return product
    return {'error': 'Product not found'}
