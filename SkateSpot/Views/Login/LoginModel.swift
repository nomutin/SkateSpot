// reference:
//  https://www.hfoasi8fje3.work/entry/2020/12/24/

import Foundation
import SwiftUI

class LoginModel: ObservableObject {
    @Published var address: String = ""
    @Published var password: String = ""
    @Published var rePassword: String = ""
    @Published var name: String = ""
    
    @Published var addressError: Bool = false
    @Published var passwordError: Bool = false
    @Published var rePasswordError: Bool = false
    @Published var nameError: Bool = false
    
    @Published var showingAccountCreateFailed: Bool = false
    @Published var showingAccountCreateSuccessed: Bool = false
    
//    @Published var isValidAddress: Bool = false
//    @Published var isValidPassword: Bool = false
//
//    @Published var isLoginButtonTapped: Bool = false
//
//    private var disposables = [AnyCancellable]()
//
//    init() {
//        $address
//            .sink(receiveValue: {
//                self.isValidAddress =  !$0.isEmpty ? true : false
//            })
//            .store(in: &disposables)
//
//        $password
//            .sink(receiveValue: {
//                self.isValidPassword = $0.isAlphanumeric && !$0.isEmpty ? true : false
//            })
//            .store(in: &disposables)
//
//        $isLoginButtonTapped
//            .sink(receiveValue: { isTapped in
//                if isTapped == true {
//                    print("DEBUG: ここでログイン処理を呼び出す")
//                }
//            })
//            .store(in: &disposables)
//    }
}


