import Foundation

protocol ProductService {
    func fetchProducts() async throws -> [Product]
}

final class LiveProductService: ProductService {
    func fetchProducts() async throws -> [Product] {
        // TODO 1: implement with URLSession
        // URL: https://fakestoreapi.com/products
        // Validate HTTP 200-299, decode [Product]
        fatalError("Candidate to implement")
    }
}

// Provided mock for testing discussion - do not change
final class MockProductService: ProductService {
    var stub: [Product] = [
        Product(id: 1, title: "Test Bag", price: 49.99,
                description: "A bag", image: "", rating: nil)
    ]
    var shouldFail = false
    func fetchProducts() async throws -> [Product] {
        if shouldFail { throw ProductError.badResponse }
        return stub
    }
}
