//
//  AddProductView.swift
//  A2_iOS_Ayesha_100949840
//
//  Created by Ayesha Akbar on 2026-04-01.
//

import SwiftUI
import CoreData

struct AddProductView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var productName = ""
    @State private var productDescription = ""
    @State private var productPrice = ""
    @State private var productProvider = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                Text("Add Product")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text("Product Information")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                VStack(spacing: 16) {
                    TextField("Product Name", text: $productName)
                        .padding()
                        .background(Color.gray.opacity(0.08))
                        .cornerRadius(12)
                    
                    TextField("Product Description", text: $productDescription)
                        .padding()
                        .background(Color.gray.opacity(0.08))
                        .cornerRadius(12)
                    
                    TextField("Product Price", text: $productPrice)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.gray.opacity(0.08))
                        .cornerRadius(12)
                    
                    TextField("Product Provider", text: $productProvider)
                        .padding()
                        .background(Color.gray.opacity(0.08))
                        .cornerRadius(12)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.05), radius: 6)
                
                Button(action: {
                    saveProduct()
                }) {
                    Text("Save Product")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
            }
            .padding(.horizontal)
        }
        .background(Color(.systemGray6))
    }
    
    private func saveProduct() {
        let newProduct = Product(context: viewContext)
        newProduct.productName = productName
        newProduct.productDescription = productDescription
        newProduct.productPrice = Double(productPrice) ?? 0.0
        newProduct.productProvider = productProvider
        newProduct.productId = Int64.random(in: 1...9999)

        do {
            try viewContext.save()
            dismiss()
        } catch {
            print("Failed to save product: \(error.localizedDescription)")
        }
    }
}
