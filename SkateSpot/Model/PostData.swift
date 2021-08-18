import Foundation
import SwiftUI

struct PostData: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var adress: String
    
    var loadSurface: Int
    var kickout: Int
    var rainy: Int
    
    var category: String
    var caption: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var postUserId: Int
    var postDate: String
    
}


