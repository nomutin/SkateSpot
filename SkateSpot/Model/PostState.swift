import Foundation
import SwiftUI

class PostState: ObservableObject {
    @Published var image: UIImage?
    @Published var showingImagePicker: Bool = false
    @Published var isShowingModal: Bool = false
    @Published var showingModal: Bool = false
}
