# ☕ Starbucks Product App (iOS)

## 📱 Overview

This is a mobile iOS application built using **SwiftUI** and **Core Data**.
The app allows Starbucks  to view, search, and manage product information directly on their device.

---

## ⚙️ Features

* View the **latest product** on the home screen
* Navigate through products using **Next / Previous buttons**
* View a **full list of products**
* **Search** products by:

  * Product Name
  * Product Description
* **Add new products** to the database
* Data is stored locally using **Core Data**

---

## 🧠 How It Works

The application uses **Core Data** as its local database.

* All product data is stored persistently on the device
* The home screen fetches and displays product data using:

  * `@FetchRequest`
* When a user adds a new product:

  * It is saved into Core Data
  * The UI updates automatically

---

## 🏗️ Technologies Used

* SwiftUI
* Core Data
* Xcode

---

## 📊 Product Information Structure

Each product contains:

* Product ID
* Product Name
* Product Description
* Product Price
* Product Provider

---

## 🚀 User Flow

1. Launch the app → First/latest product is displayed
2. Use **Next / Previous** to navigate
3. Tap **View All Products** to see full list
4. Use the **search bar** to filter products
5. Tap **Add Product** to insert new data

---

## 📌 Notes

* The app requires at least **10 products** stored in Core Data
* All data is stored locally (no external API used)

---

## 👤 Author

Ayesha Akbar
© 2026
