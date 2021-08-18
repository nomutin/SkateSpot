//
//  SwiftUIView.swift
//  SkateSpot
//
//  Created by 野村優太 on 2021/08/15.
//

import SwiftUI

struct SwiftUIView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            Text("\(ReverseGeoCode(latitude: 35.6769883, longtitude: 139.7588499))")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView().environmentObject(ModelData())
    }
}
