import SwiftUI

struct SpotCatalogueItem: View {
    var postData: PostData
    
    let itemWidth:  CGFloat = 200
    let itemHeight: CGFloat = 150
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomTrailing) {
                postData.image
                    .resizable()
                    .frame(width: itemWidth, height: itemHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                    .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.white, lineWidth: 1))
                    .shadow(radius: 1)
            }
            
            HStack {
                Text(postData.name)
                    .font(.caption)
                    .foregroundColor(Color.black)
                Spacer()
                // SpotStatusIconMini(iconImage: Image("kickout"), iconColor: kickoutIconColor, size: 18)
                // SpotStatusIconMini(iconImage: Image("roadSurface"), iconColor: roadSurfaceIconColor, size: 18)
                // SpotStatusIconMini(iconImage: Image("rainy"), iconColor: rainSpotIconColor, size: 18)
            }
        }
        .padding(.leading, 15)
    }
}

struct SpotCatalogueItem_Previews: PreviewProvider {
    static var previews: some View {
        SpotCatalogueItem(postData: ModelData().postData[2])
    }
}

