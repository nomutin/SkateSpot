import SwiftUI

struct SpotCatalogueItem: View {
    var postData: PostData
    
    let itemWidth:  CGFloat = 220
    let itemHeight: CGFloat = 165
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomTrailing) {
                postData.image
                    .resizable()
                    .frame(width: itemWidth, height: itemHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 1))
            }
            
            HStack {
                Text(postData.name)
                    .font(.caption)
                    .foregroundColor(Color.accentColor)
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

