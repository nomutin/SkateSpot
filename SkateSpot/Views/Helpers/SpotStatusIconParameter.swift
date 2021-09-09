import SwiftUI

struct StatusParam: Identifiable {
    let id = UUID()
    var value: Int
    var description: String
    var color: Color
}

struct StatusParams: Identifiable {
    let id = UUID()
    let name: String
    let param: [StatusParam]
}

private let s1 = StatusParam(value: 1, description: "POOR", color: Color.red)
private let s2 = StatusParam(value: 2, description: "AVERAGE", color: Color.yellow)
private let s3 = StatusParam(value: 3, description: "GOOD", color: Color.accentColor)

private let k1 = StatusParam(value: 1, description: "NEVER", color: Color.accentColor)
private let k2 = StatusParam(value: 2, description: "OFTEN", color: Color.red)
private let k3 = StatusParam(value: 3, description: "SOON", color: Color.yellow)

private let r1 = StatusParam(value: 0, description: "YES", color: Color.gray)
private let r2 = StatusParam(value: 1, description: "NO", color: Color.accentColor)


let SpotStatusIconParameter = [StatusParams(name: "roadSurface", param: [s1, s1, s2, s3]),
             StatusParams(name: "kickout", param: [k1, k1, k2, k3]),
             StatusParams(name: "rainy", param: [r1, r2])
]

