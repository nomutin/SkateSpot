import SwiftUI

struct PostView: View {
    @ObservedObject var postState: PostState
    
    var body: some View {
        VStack {
            ImagePickerView(postState: postState)
        }
    }
}


struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(postState: PostState())
    }
}
