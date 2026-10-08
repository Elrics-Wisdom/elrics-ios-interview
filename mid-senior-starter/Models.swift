import Foundation

struct Product: Codable, Identifiable, Equatable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
    let rating: Rating?

    struct Rating: Codable, Equatable {
        let rate: Double
        let count: Int
    }
}

enum ProductError: Error, LocalizedError {
    case badURL, badResponse, decodingFailed
    var errorDescription: String? {
        switch self {
        case .badURL: return "Invalid URL"
        case .badResponse: return "Server error"
        case .decodingFailed: return "Data parsing failed"
        }
    }
}
