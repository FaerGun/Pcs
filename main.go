package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"
)

// Product представляет продукт
type Product struct {
	ID          int
	ImageURL    string
	Name        string
	Description string
	Price       float64
}

// Пример списка продуктов
var products = []Product{
	{ID: 1, ImageURL: "https://avatars.mds.yandex.net/get-mpic/3614670/img_id8709495867293679554.jpeg/x332_trim", Name: "Удилище Спиннинговое Major Craft Restive", Description: "Удилище обладает комфортной длинной для береговой джиговой ловли на средних и крупных реках. Также отлично подходит для ловли на колеблющиеся блёсны. При джиговой ловле в идеальных условиях начинает отстукивать с 10-ти грамм.", Price: 8600},
	{ID: 2, ImageURL: "https://main-cdn.sbermegamarket.ru/big2/hlr-system/203/047/558/333/119/3/600011418474b1.jpeg", Name: "Сумка рыболовная TSURIBITO Superbag JPN 36*23*25cm, с держателями удилищ, серая", Description: "сумка Tsuribito для рыболовных аксессуаров в уникальном дизайне треснутая земля - яркий и функциональный атрибут профессионального рыбака.", Price: 2900},
	{ID: 3, ImageURL: "https://avatars.mds.yandex.net/i?id=5c7e0cea0ebafce079e3bdbf605c4993_l-7663003-images-thumbs&n=13", Name: "Катушка безынерционная Mifine с байтраннером SPEED", Description: "Mifine Speed - это семейство безынерционок, которые подойдут для установки на фидерные удилища.", Price: 1600},
	{ID: 4, ImageURL: "https://cdn1.ozone.ru/s3/multimedia-i/6543987270.jpg", Name: "Леска плетеная DAIWA J-Braid X4 Yellow 135м", Description: "Высококлассный плетеный шнур отменного японского качества J-Braid X4 от фирмы Daiwa состоит из четырех волокон высококачественного полиэтилена, имеет очень плотное плетение и сечение, максимально приближенное к круглому.", Price: 900},
	{ID: 5, ImageURL: "https://avatars.mds.yandex.net/i?id=6341d76a546b8010e127b8e0b1212b8a7f2706d7-9541119-images-thumbs&n=13", Name: "Воблер Bassday Sugar Deep Short Bill 75F", Description: "Инженеры Bassday разработали представленные модели для акваторий с неспешным течением, но приличной глубиной. Для успеха на меляках производители рекомендуют вести минноу так, чтобы он ударялся о дно.", Price: 510},
	{ID: 6, ImageURL: "https://avatars.mds.yandex.net/get-mpic/5254781/2a0000018e596a0a07ad16b177c4271e3229/orig", Name: "Приманка XXL Fish джиговая Флажок Модель № 2 ", Description: "Приманка Мандула Флажок XXL Fish Модель №2 Представляем вам новинку - приманку Мандула Флажок XXL Fish. Благодаря своей уловистости, приманка заинтересовала многих любителей рыбалки и получила широкую распространенность.", Price: 110},
	{ID: 7, ImageURL: "https://avatars.mds.yandex.net/i?id=60a61ae10063417954ce9288a4e97949_l-4264709-images-thumbs&n=13", Name: "Надувная лодка Leader Тундра-380", Description: "Моторно-гребная лодка с НДНД. Модель представлена в двух размерах 325 мм и 380 мм.  Выполнена из ткани плотностью 750  гр. на кв.м.", Price: 49300},

}

// обработчик для GET-запроса, возвращает список продуктов
func getProductsHandler(w http.ResponseWriter, r *http.Request) {
	// Устанавливаем заголовки для правильного формата JSON
	w.Header().Set("Content-Type", "application/json")
	// Преобразуем список заметок в JSON
	json.NewEncoder(w).Encode(products)
}

// обработчик для POST-запроса, добавляет продукт
func createProductHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Invalid request method", http.StatusMethodNotAllowed)
		return
	}

	var newProduct Product
	err := json.NewDecoder(r.Body).Decode(&newProduct)
	if err != nil {
		fmt.Println("Error decoding request body:", err)
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	fmt.Printf("Received new Product: %+v\n", newProduct)
	var lastID int = len(products)

	for _, productItem := range products {
		if productItem.ID > lastID {
			lastID = productItem.ID
		}
	}
	newProduct.ID = lastID + 1
	products = append(products, newProduct)

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(newProduct)
}

//Добавление маршрута для получения одного продукта

func getProductByIDHandler(w http.ResponseWriter, r *http.Request) {
	// Получаем ID из URL
	idStr := r.URL.Path[len("/Products/"):]
	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "Invalid Product ID", http.StatusBadRequest)
		return
	}

	// Ищем продукт с данным ID
	for _, Product := range products {
		if Product.ID == id {
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(Product)
			return
		}
	}

	// Если продукт не найден
	http.Error(w, "Product not found", http.StatusNotFound)
}

// удаление продукта по id
func deleteProductHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodDelete {
		http.Error(w, "Invalid request method", http.StatusMethodNotAllowed)
		return
	}

	// Получаем ID из URL
	idStr := r.URL.Path[len("/Products/delete/"):]
	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "Invalid Product ID", http.StatusBadRequest)
		return
	}

	// Ищем и удаляем продукт с данным ID
	for i, Product := range products {
		if Product.ID == id {
			// Удаляем продукт из среза
			products = append(products[:i], products[i+1:]...)
			w.WriteHeader(http.StatusNoContent) // Успешное удаление, нет содержимого
			return
		}
	}

	// Если продукт не найден
	http.Error(w, "Product not found", http.StatusNotFound)
}

// Обновление продукта по id
func updateProductHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPut {
		http.Error(w, "Invalid request method", http.StatusMethodNotAllowed)
		return
	}

	// Получаем ID из URL
	idStr := r.URL.Path[len("/Products/update/"):]
	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "Invalid Product ID", http.StatusBadRequest)
		return
	}

	// Декодируем обновлённые данные продукта
	var updatedProduct Product
	err = json.NewDecoder(r.Body).Decode(&updatedProduct)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Ищем продукт для обновления
	for i, Product := range products {
		if Product.ID == id {

			products[i].ImageURL = updatedProduct.ImageURL
			products[i].Name = updatedProduct.Name
			products[i].Description = updatedProduct.Description
			products[i].Price = updatedProduct.Price

			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(products[i])
			return
		}
	}

	// Если продукт не найден
	http.Error(w, "Product not found", http.StatusNotFound)
}

func main() {
	http.HandleFunc("/products", getProductsHandler)           // Получить все продукты
	http.HandleFunc("/products/create", createProductHandler)  // Создать продукт
	http.HandleFunc("/products/", getProductByIDHandler)       // Получить продукт по ID
	http.HandleFunc("/products/update/", updateProductHandler) // Обновить продукт
	http.HandleFunc("/products/delete/", deleteProductHandler) // Удалить продукт

	fmt.Println("Server is running on port 8080!")
	http.ListenAndServe(":8080", nil)
}
