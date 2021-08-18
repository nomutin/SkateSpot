import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var postData: [PostData] = load("dummySpotData.json")
    @Published var userData: [UserData] = load("dummyUserData.json")
    @Published var Favorites: [Int: Int] = loadNumberOfFavorite(postDataPath: "dummySpotData.json", userDataPath: "dummyUserData.json")
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func loadNumberOfFavorite(postDataPath: String, userDataPath: String) -> [Int: Int] {
    let postData: [PostData] = load(postDataPath)
    let userData: [UserData] = load(userDataPath)
    var favoriteDict: [Int: Int] = [:]
    for post in postData {
        var favorites: Int = 0
        for usr in userData {
            favorites = usr.favoriteSpotId.firstIndex(of: post.id) != nil ? favorites + 1 : favorites
        }
        favoriteDict.updateValue(favorites, forKey: post.id)
    }
    return favoriteDict
}
