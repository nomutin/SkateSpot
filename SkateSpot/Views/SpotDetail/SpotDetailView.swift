//  スポットの詳細画面
//
//  Referense:
//    https://medium.com/swlh/swiftui-create-a-stretchable-header-with-parallax-scrolling-4a98faeeb262


import SwiftUI

struct SpotDetailView: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode
    var postdata: PostData
    
    var body: some View {
        ScrollView {
            GeometryReader {geo in
                postdata.image.resizable()
                    .offset(y: -geo.frame(in: .global).minY)
                    .frame(width: UIScreen.main.bounds.size.width, height: geo.frame(in: .global).minY > 0 ? geo.frame(in: .global).minY + 300 : 300)
            }.frame(height: 300)
            
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(postdata.name).font(.title).foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "heart").foregroundColor(.pink)
                    Text(modelData.Favorites[postdata.id]!.description)
                        .foregroundColor(.primary).font(.body).offset(x: -5)
                }
                
                HStack {
                    Text(postdata.adress)
                    Spacer()
                    Text(postdata.category)
                }.font(.subheadline).foregroundColor(.secondary)
                    
                Divider()
                    
                SpotStatusRowFull(postdata: postdata)
                
                Divider()
                    
                Text("About This Spot :").foregroundColor(.primary).font(.title2)
                    
                Text(postdata.caption).font(.body).padding().offset(y: -15)
                    
                HStack {
                    Spacer()
                    Text("Posted by \(loadPostUser()) on \(postdata.postDate)")
                }.font(.headline).foregroundColor(.secondary).offset(y: -20)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .offset(y: -20)
        }
            .edgesIgnoringSafeArea(.top)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarItems(leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    }) {
                    BackButton(size: 40)
                }
            )
        
    }
    
    func loadPostUser() -> String {
        for user in modelData.userData {
            if user.id == postdata.postUserId {
                return user.name
            }
        }
        return ""
    }
}

struct SpotDetailView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ForEach(["iPhone  12 mini", "iPhone 11"], id: \.self) {deviceName in
            SpotDetailView(postdata: modelData.postData[1])
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

