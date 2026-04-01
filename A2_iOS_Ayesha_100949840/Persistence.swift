//
//  Persistence.swift
//  A2_iOS_Ayesha_100949840
//
//  Created by Ayesha Akbar on 2026-04-01.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    @MainActor
    static let preview: PersistenceController = {
        PersistenceController(inMemory: true)
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "A2_iOS_Ayesha_100949840")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }

        container.viewContext.automaticallyMergesChangesFromParent = true

        seedProductsIfNeeded(context: container.viewContext)
    }
    
    private func seedProductsIfNeeded(context: NSManagedObjectContext) {
        let fetchRequest = NSFetchRequest<Product>(entityName: "Product")
        
        do {
            let count = try context.count(for: fetchRequest)

            // Only insert if database is empty
            if count == 0 {
                let sampleProducts = [
                    ("Latte", "Hot coffee with milk", 4.50, "Starbucks"),
                    ("Cappuccino", "Foamy coffee", 4.75, "Starbucks"),
                    ("Espresso", "Strong black coffee", 3.00, "Starbucks"),
                    ("Mocha", "Chocolate flavored coffee", 5.00, "Starbucks"),
                    ("Americano", "Diluted espresso", 3.50, "Starbucks"),
                    ("Flat White", "Smooth coffee with milk", 4.80, "Starbucks"),
                    ("Macchiato", "Espresso with foam", 4.20, "Starbucks"),
                    ("Cold Brew", "Cold steeped coffee", 4.90, "Starbucks"),
                    ("Iced Latte", "Cold milk coffee", 4.60, "Starbucks"),
                    ("Frappuccino", "Blended iced drink", 5.50, "Starbucks")
                ]

                for (index, product) in sampleProducts.enumerated() {
                    let newProduct = Product(context: context)
                    newProduct.productId = Int64(index + 1)
                    newProduct.productName = product.0
                    newProduct.productDescription = product.1
                    newProduct.productPrice = product.2
                    newProduct.productProvider = product.3
                }

                try context.save()
            }

        } catch {
            print("Error seeding data: \(error)")
        }
    }
}
