import SwiftUI

let kickoutIcon = (
    never: StatusIcon(size: 100, content: "police", condition: "times", conditionColor: Color.accentColor),
    often: StatusIcon(size: 100, content: "police", condition: "triangle", conditionColor: Color.yellow),
    soon: StatusIcon(size: 100, content: "police", condition: "circle", conditionColor: Color.red)
)

let surfaceIcon = (
    good: StatusIcon(size: 100, content: "surface", condition: "circle", conditionColor: Color.accentColor),
    average: StatusIcon(size: 100, content: "surface", condition: "triangle", conditionColor: Color.yellow),
    bad: StatusIcon(size: 100, content: "surface", condition: "times", conditionColor: Color.red)
)




struct StatusIcon: View {
    var size: CGFloat
    var content: String
    var iconColor: Color = Color.accentColor
    var condition: String
    var conditionColor: Color
    
    var body: some View {
        VStack (spacing: 5){
            Text(text())
                .foregroundColor(iconColor)
                .font(.system(size: size/3.5, weight: .black, design: .default))


            ZStack (alignment: .bottomTrailing){
                image()
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .colorMultiply(iconColor)
                
                if condition == "circle" {
                    OverLayyedCircle(size: size/1.5, color: conditionColor)
                        .offset(x: size/4, y: size/4)
                }
                else if condition == "triangle" {
                    OverLayyedTriangle(size: size/1.5, color: conditionColor)
                        .offset(x: size/4, y: size/4)
                }
                else if condition == "times" {
                    OverLayyedTimes(size: size/1.5, color: conditionColor)
                        .offset(x: size/4, y: size/4)
                }
                
            }
            .frame(width: size, height: size)
        }
    }
    
    private func text() -> String {
        switch self.content {
        case "surface": return "SURFACE"
        case "police": return "KICKOUT"
        case "rain": return "RAINY"
        default:  return ""
        }
    }
    
    private func image() -> Image {
        switch self.content {
        case "surface": return Image("road")
        case "police": return Image("police")
        case "rain": return Image("rain")
        default:  return Image("")
        }
    }
}


struct OverLayyedCircle: View {
    var size: CGFloat
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white , lineWidth: size/3.5)
                .frame(width: size, height: size, alignment: .center)
            Circle()
                .stroke(color, lineWidth: size/6)
                .frame(width: size, height: size, alignment: .center)
        }
            
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.closeSubpath()
        }
    }
}

struct OverLayyedTriangle: View {
    var size: CGFloat
    var color: Color

    var body: some View {
        ZStack {
            Triangle()
                .stroke(Color.white , lineWidth: size/3)
                .frame(width: size, height: size, alignment: .center)
            Triangle()
                .stroke(color, lineWidth: size/7)
                .frame(width: size, height: size, alignment: .center)
        }
    }
}

struct Times: Shape {
    func path(in rect: CGRect) -> Path  {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct OverLayyedTimes: View {
    var size: CGFloat
    var color: Color

    var body: some View {
        ZStack {
            Times()
                .stroke(Color.white , lineWidth: size/3)
                .frame(width: size, height: size, alignment: .center)
            Times()
                .stroke(color, lineWidth: size/6.5)
                .frame(width: size*0.9, height: size*0.9, alignment: .center)
        }
    }
}

struct StatusIcon_Previews: PreviewProvider {
    static var previews: some View {
        surfaceIcon.bad
    }
}
