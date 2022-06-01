//
//  Registration.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 21.04.2022.
//

import SwiftUI



struct RegData {
    // user reg Data
    var email: String        = "";
    var username: String     = "";
    var password: String     = "";
    var repeatPass: String   = "";
    var firstName: String    = "";
    var lastName: String     = "";
    var profileImage: String? = "";
}



struct Registration: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var ErrorBanner: ErrorBannerModel
    @EnvironmentObject var loader: LoaderModel
    
    var queryExecutor: QueryExecutor {
        return QueryExecutor(loaderInfo: loader, userData: userData, errorBannerInfo: ErrorBanner)
    }
    
    
    @State var regData = RegData();
    
    var body: some View {
        ZStack {
            VStack {
                InputView(text: $regData.username, type: .clean, placeHolder: "Username");
                HStack {
                    InputView(text: $regData.firstName, type: .ordinary, placeHolder: "First name");
                    InputView(text: $regData.lastName, type: .ordinary, placeHolder: "Last name")
                }
                InputView(text: $regData.email, type: .clean, placeHolder: "Email");
                InputView(text: $regData.password, type: .secure, placeHolder: "Password");
                InputView(text: $regData.repeatPass, type: .secure, placeHolder: "Repeat password");
                Button(action: {
                    HandleRegistration()
                }) {
                    Text("Register")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                }
                .padding(15)
                .padding(.horizontal)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(20)
                .padding(.top, 40)
            }
            .ignoresSafeArea(.keyboard)
            .padding(.horizontal, 50)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    enum inputTypes {
        case username, password
    }
    
    func isEmpty(value: String?) -> Bool {
        guard let unwrappedValue = value else { return true }
        return unwrappedValue.trimmingCharacters(in: .whitespacesAndNewlines).count == 0
    }
    
    func HandleRegistration() {
        if (isEmpty(value: regData.username) || isEmpty(value: regData.email) || isEmpty(value: regData.password) || isEmpty(value: regData.firstName) || isEmpty(value: regData.lastName) || isEmpty(value: regData.repeatPass)) {
            ErrorBanner.Show(Message: "Fields are empty")
        } else if regData.password != regData.repeatPass {
            ErrorBanner.Show(Message: "Passwords don't match")
        } else {
            let userInput = UserInput(username: regData.username, email: regData.email, password: regData.password, firstName: regData.firstName, lastName: regData.lastName, profileImage: regData.profileImage)
            queryExecutor.RegisterUser(userInput: userInput)
        }
    }
    
    func validate(text: String, type: inputTypes) -> Bool {
        if type == .username {
            let pattern = #"^\S+@\S+\.\S+$"#;
            guard text.range(of: pattern, options: .regularExpression) != nil || text.count == 0 else {
                return false
            }
            return true
        } else if type == .password || text.count == 0 {
            guard text.count >= 8 else { return false }
            return true
        } else {
            print("IDK")
        }
        return false
    }
    
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
    }
}
