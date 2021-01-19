//
//  SignInScreen.swift
//  NotificationCenterPushingPage
//
//  Created by Зехниддин on 19/01/21.
//

import SwiftUI

struct SignInScreen: View {
    @State var showSignUpScreen = false
    
    @State private var userID = ""
    @State private var userPW = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("im_man")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .clipShape(Circle())
            
            TextField("User ID", text: $userID)
                .modifier(FieldsStyle())
            
            SecureField("User PW", text: $userPW)
                .modifier(FieldsStyle())
            
            Button(action: {
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }) {
                Text("Sign In")
                    .modifier(ButtonStyle())
            }
            
            Spacer()
            
            HStack(spacing: 8) {
                Text("Don't have an account?")
                Button(action: {
                    self.showSignUpScreen.toggle()
                }) {
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                
            }
            .foregroundColor(.blue)
            .font(.system(size: 18))
            .padding(.bottom, 8)
        }
        .sheet(isPresented: $showSignUpScreen) {
            SignUpScreen()
        }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}

struct FieldsStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .padding(14)
            .background(Color.init(.systemGray5))
            .cornerRadius(60)
            .padding(.horizontal)
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(14)
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(60)
            .padding(.horizontal)
            .font(.system(size: 20))
    }
}
