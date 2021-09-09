import SwiftUI

struct FloatingTabbar: View {
    @EnvironmentObject var modelData: ModelData
    @State var selectedTab: String = "スポット一覧"
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                SpotCatalogueView()
                    .tag("スポット一覧")
                Map(enableTap: false)
                    .tag("マップ")
                PostView(postState: PostState())
                    .tag("投稿")
                Text("Coming Soon...")
                    .tag("設定")
            }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .ignoresSafeArea(.all, edges: .all)
                
            
            VStack {
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                HStack {
                    TabbarButton(image: "list.dash", title: "スポット一覧", selectedTab: $selectedTab)
                    TabbarButton(image: "map", title: "マップ", selectedTab: $selectedTab)
                    TabbarButton(image: "camera", title: "投稿", selectedTab: $selectedTab)
                    TabbarButton(image: "gearshape", title: "設定", selectedTab: $selectedTab)
                }
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -5)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 5)
                .padding(.horizontal, 10)
                .padding(.bottom, -10)
            }
        }
    }
}


struct TabbarButton: View {
    var image: String
    var title: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation{
                selectedTab = title
            }
        }) {
            VStack(spacing: 8) {
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(selectedTab == title ? .accentColor : .gray)
                    .frame(height: 20)
                
                if selectedTab == title {
                    Text(title)
                        .font(.caption)
                        .foregroundColor(.accentColor)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
        }
    }
}

struct FloatingTabbar_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTabbar().environmentObject(ModelData())
    }
}
