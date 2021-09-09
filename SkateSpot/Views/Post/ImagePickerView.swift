import SwiftUI

struct ImagePickerView: View {
    @ObservedObject var postState: PostState
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if let uiImage = postState.image {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 300, height: 240)
                    .cornerRadius(10)
                    
            } else {
                Text("\(Image(systemName: "photo.fill")) NO IMAGE")
                    .font(.title)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 240)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 4)
                            )
        
            }
            Spacer().frame(height: 32)
            Button(action: {
                postState.showingImagePicker = true
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 30, height: 30)
                    .padding()
            }
        }
        .sheet(isPresented: $postState.showingImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $postState.image)
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(postState: PostState())
    }
}
