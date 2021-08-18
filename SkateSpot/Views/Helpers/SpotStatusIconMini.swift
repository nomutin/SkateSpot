// パーク一覧に載せる小さいアイコン

import SwiftUI

struct SpotStatusIconMini: View {
    var iconImage: Image
    var iconColor: Color
    var size: CGFloat
    
    var body: some View {
        iconImage
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .colorMultiply(iconColor)
            .cornerRadius(size/2)
            .overlay(RoundedRectangle(cornerRadius: size/2).stroke(iconColor, lineWidth: size/30))
    }
}

struct SpotStatusIconMini_Previews: PreviewProvider {
    static var previews: some View {
        SpotStatusIconMini(iconImage: Image("kickout"), iconColor: Color("StatusIconColor"), size: 300.0)
    }
}

