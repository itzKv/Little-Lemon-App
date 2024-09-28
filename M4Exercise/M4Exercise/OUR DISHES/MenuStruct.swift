import Foundation

struct JSONMenu: Codable {
    // add code here
    let menu: [MenuItem] // Array of MenuItem JSON
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}


struct MenuItem: Codable, Hashable, Identifiable {
    let id =  UUID()
    let title: String
    let price: String // Initially decode it as String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case price = "price"
    }
}
