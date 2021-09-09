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
                .font(.body)
                .frame(width: 80)
                
            statusImage
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 60)
                .colorMultiply(iconColor)
                
            Text(statusDescription)
                .font(.headline)
                .frame(width: 80)
        }
        .padding(EdgeInsets(
            top: 3,
            leading: 12,
            bottom: 2,
            trailing: 12
        ))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(iconColor, lineWidth: 2))
    }
}


struct SpotStatusIconFull_Previews: PreviewProvider {
    static var previews: some View {
        SpotStatusIconFull(statusName: "KICKOUT", statusImage: Image("kickout"), statusDescription: "SOON", iconColor: Color.accentColor)
    }
}

