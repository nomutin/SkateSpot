import Foundation

struct UserData: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var favoriteSpotId: [Int]
}
