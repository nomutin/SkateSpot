// パーク詳細画面に出すパーク情報のでかいアイコン


import SwiftUI

struct SpotStatusIconFull: View {
    var statusName: String
    var statusImage: Image
    var statusDescription: String
    var iconColor: Color
    
    var body: some View {
        VStack {
            Text(statusName)
                .foregroundColor(iconColor)
                .font(.body)
            
            statusImage
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 80)
                .colorMultiply(iconColor)
            
            Text(statusDescription)
                .foregroundColor(iconColor)
                .font(.headline)
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(iconColor, lineWidth: 2))
    }
}

struct SpotStatusIconFull_Previews: PreviewProvider {
    static var previews: some View {
        SpotStatusIconFull(statusName: "KICKOUT", statusImage: Image("kickout"), statusDescription: "SOON", iconColor: Color.red)
    }
}

