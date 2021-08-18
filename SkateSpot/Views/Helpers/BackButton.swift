import SwiftUI

struct BackButton: View {
    var size: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: size, height: size)
                .foregroundColor(Color.black.opacity(0.5))
            
            Image(systemName: "arrow.backward")
                .resizable()
                .foregroundColor(.white)
                .scaledToFill()
                .frame(width: size/1.5, height: size/1.8)
                .cornerRadius(size/2)
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(size: 60)
    }
}
