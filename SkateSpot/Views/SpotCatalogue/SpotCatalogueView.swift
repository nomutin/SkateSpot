import SwiftUI

struct SpotCatalogueView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                SpotCatalogueRow(categoryName: "Sponsored Shops", dataSequence: modelData.postData)
                    .foregroundColor(Color.accentColor)
                
                SpotCatalogueRow(categoryName: "Latest Spot", dataSequence: modelData.postData)
                    .foregroundColor(Color.accentColor)
                
                SpotCatalogueRow(categoryName: "Your Favorite Spot", dataSequence: modelData.postData)
                    .foregroundColor(Color.accentColor)
                
            }.navigationTitle("スポット一覧").foregroundColor(Color.accentColor)
        }
    }
    
    init() {
        setupNavigationBar()
    }
     
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.black.opacity(0))
        appearance.titleTextAttributes = [.foregroundColor: UIColor(Color.accentColor)]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.accentColor)]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

struct SpotCatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        SpotCatalogueView().environmentObject(ModelData())
    }
}

