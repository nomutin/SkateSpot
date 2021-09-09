import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State var isLogin: Bool = Auth.auth().currentUser == nil
    
    var body: some View {
        TabView{
            SpotCatalogueView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("スポット一覧")
                }
            Map(enableTap: false)
                .tabItem {
                    Image(systemName: "map")
                    Text("マップ")
                }
            PostView(postState: PostState())
                .tabItem {
                    Image(systemName: "camera")
                    Text("投稿")
                }
            Text("Coming Soon...")
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("設定")
                }
        }
        .sheet(isPresented: $isLogin) {
            LoginView(loginModel: LoginModel())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 11"], id: \.self) {deviceName in
            ContentView().environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

