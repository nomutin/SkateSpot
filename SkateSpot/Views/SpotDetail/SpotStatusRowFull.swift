

import SwiftUI

struct SpotStatusRowFull: View {
    var postdata: PostData
    
    var body: some View {
        HStack {
            SpotStatusIconFull(statusName: "SURFACE",
                               statusImage: Image("roadSurface"),
                               statusDescription: SpotStatusIconParameter[0].param[postdata.loadSurface].description,
                               iconColor: SpotStatusIconParameter[0].param[postdata.loadSurface].color
                                )
            
            SpotStatusIconFull(statusName: "KICKOUT",
                               statusImage: Image("kickout"),
                               statusDescription: SpotStatusIconParameter[1].param[postdata.kickout].description,
                               iconColor: SpotStatusIconParameter[1].param[postdata.kickout].color
            )
            
            SpotStatusIconFull(statusName: "RAINY",
                               statusImage: Image("rainy"),
                               statusDescription: SpotStatusIconParameter[2].param[postdata.rainy].description,
                               iconColor: SpotStatusIconParameter[2].param[postdata.rainy].color
            )
        }
    }
}

struct SpotStatusRowFull_Previews: PreviewProvider {
    static var previews: some View {
        SpotStatusRowFull(postdata: ModelData().postData[0])
    }
}
