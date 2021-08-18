import SwiftUI

struct SpotCatalogueView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                SpotCatalogueRow(categoryName: "Sponsored Shops(仮)", dataSequence: modelData.postData)
                
                SpotCatalogueRow(categoryName: "Latest Spots", dataSequence: modelData.postData)
                
                SpotCatalogueRow(categoryName: "Your Favorite Spots(仮)", dataSequence: modelData.postData)
                
            }.navigationTitle("スポット一覧")
        }
    }
}

struct SpotCatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        SpotCatalogueView().environmentObject(ModelData())
    }
}

