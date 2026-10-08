import Foundation

// TODO 1: Make this Codable so it decodes from:
// [{ "id": 1, "name": "Leanne Graham", "email": "Sincere@april.biz",
//    "address": { "city": "Gwenborough" } }]

struct User: Identifiable {
    let id: Int
    let name: String
    let email: String
    // TODO: add city from nested address object
    // Hint: you will need nested structs or custom CodingKeys
}
