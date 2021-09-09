import SwiftUI
import Firebase

struct LoginView: View {
    @ObservedObject var loginModel: LoginModel
    
    var body: some View {
        VStack {
            Text("アカウント作成/ログイン")
                .font(.title)
                .foregroundColor(Color.accentColor)
                .padding()
                
            LoginEnterForm(
                titleIcon: Image(systemName: "envelope"),
                formTitle: "Address",
                defaultText: "メールアドレスを入力",
                errorText: "メールアドレスが必要です",
                isSecure: false,
                content: $loginModel.address,
                isError: $loginModel.addressError
            )
                
            LoginEnterForm(
                titleIcon: Image(systemName: "key"),
                formTitle: "PassWord",
                defaultText: "パスワードを入力(6文字以上)",
                errorText: "パスワードを入力してください",
                isSecure: true,
                content: $loginModel.password,
                isError: $loginModel.passwordError
            )
            LoginEnterForm(
                titleIcon: Image(systemName: "key"),
                formTitle: "",
                defaultText: "アカウント作成時はもう一度入力",
                errorText: "パスワードが一致しません",
                isSecure: true,
                content: $loginModel.rePassword,
                isError: $loginModel.rePasswordError
            )
            
                
            LoginEnterForm(
                titleIcon: Image(systemName: "person"),
                formTitle: "UserName",
                defaultText: "アカウント作成時はユーザ名を入力",
                errorText: "アカウント作成にはユーザ名が必要です",
                isSecure: false,
                content: $loginModel.name,
                isError: $loginModel.nameError
            )
                
                
            Button(action: {
                createAccount(loginModel: loginModel)
            }) {
                Text("アカウント作成")
            }
                .frame(width: 150, alignment: .center)
                .padding()
                .accentColor(Color.white)
                .background(Color.accentColor)
                .cornerRadius(26)
                .padding()
                .alert(isPresented: $loginModel.showingAccountCreateFailed, content: {
                    Alert(
                        title: Text("アカウント作成失敗"),
                        message: Text("アカウント作成に失敗しました．メールアドレスが有効なものか，パスワードが6文字以上かを確認してください．")
                    )
                })
                
            Button(action: {
                createAccount(loginModel: loginModel)
            }) {
                Text("ログイン")
            }
                .frame(width: 150, alignment: .center)
                .padding()
                .accentColor(Color.white)
                .background(Color.accentColor)
                .cornerRadius(26)
                
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginModel: LoginModel())
    }
}


func createAccount(loginModel: LoginModel) {
    let address: String = loginModel.address
    let password: String = loginModel.password
    let rePassword: String = loginModel.rePassword
    let name: String = loginModel.name
    
    loginModel.addressError = address.isEmpty
    loginModel.passwordError = password.isEmpty
    loginModel.nameError = name.isEmpty 
    loginModel.rePasswordError = password != rePassword
    
    if address.isEmpty || password.isEmpty || name.isEmpty || (password != rePassword){
        return
    }

    Auth.auth().createUser(withEmail: address, password: password) { authResult, error in
        if error != nil {
            print("DEBUG_PRINT: " + error!.localizedDescription)
            return
        }
    }
}
