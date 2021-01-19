//
//  SignUpScreen.swift
//  NotificationCenterPushingPage
//
//  Created by Зехниддин on 19/01/21.
//

import SwiftUI

struct SignUpScreen: View {
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var address = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("First name", text: $firstName)
                .modifier(FieldsStyle())
            TextField("Last name", text: $lastName)
                .modifier(FieldsStyle())
            TextField("Email", text: $email)
                .modifier(FieldsStyle())
            TextField("Address", text: $address)
                .modifier(FieldsStyle())
            SecureField("Password", text: $password)
                .modifier(FieldsStyle())
            
            Button(action: {
                
            }) {
                Text("Sign Up")
                    .modifier(ButtonStyle())
            }
            
            Spacer()
            
            HStack {
                Text("Already have an account?")
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }) {
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
            }
            .foregroundColor(.blue)
            .font(.system(size: 18))
            .padding(.bottom, 8)
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
