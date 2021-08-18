//  メイン選択画面

import SwiftUI

struct SpotCatalogueRow: View {
    @EnvironmentObject var modelData: ModelData
    var categoryName: String
    var dataSequence: [PostData]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(categoryName)
                .font(.headline)
                .padding(.top, 5)
                .padding(.leading, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(alignment: .top, spacing: 0) {
                    ForEach(dataSequence) { postData in
                    // FIXME ForEach内の NavigationLinkはバグるらしい
                        NavigationLink(destination: SpotDetailView(postdata: postData)) {
                            SpotCatalogueItem(postData: postData)
                        }
                    }
                }
                
            }
            
        }
    }
}

struct SpotCatalogueRow_Previews: PreviewProvider {
    static var postData = ModelData().postData
    
    static var previews: some View {
        SpotCatalogueRow(categoryName: "Latest Spots", dataSequence: postData)
            .environmentObject(ModelData())
    }
}

