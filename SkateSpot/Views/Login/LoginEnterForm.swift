import SwiftUI

struct LoginEnterForm: View {
    let titleIcon: Image
    let formTitle: String
    let defaultText: String
    let errorText: String
    
    @Binding var content: String
    @Binding var isError: Bool
    
    @State var editting: Bool = false
    
    
    var body: some View {
        VStack {
            VStack (alignment: .leading){
                if formTitle != "" {
                    Text("\(titleIcon) \(formTitle)")
                        .font(.headline).foregroundColor(Color("StatusIconColor"))
                }
                
                TextField(defaultText, text: $content,
                    onEditingChanged: { begin in editting = begin ? true : false}
                )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: editting ? Color("StatusIconColor") : .clear, radius: 3)
            }.padding(.horizontal)
            
            HStack {
                Spacer()
                isError ? Text("\(Image(systemName: "exclamationmark.triangle")) \(errorText)")
                    .font(.caption).foregroundColor(Color("StatusIconColor")) : Text(" ")
            }.padding(.trailing)
        }
    }
}


