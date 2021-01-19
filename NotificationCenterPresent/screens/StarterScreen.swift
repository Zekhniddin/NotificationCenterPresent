//
//  StarterScreen.swift
//  NotificationCenterPushingPage
//
//  Created by Зехниддин on 19/01/21.
//

import SwiftUI

struct StarterScreen: View {
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        VStack {
            if self.status {
                HomeScreen()
            } else {
                SignInScreen()
            }
        }
        .onAppear {
            let name = NSNotification.Name("status")
            NotificationCenter.default.addObserver(forName: name, object: nil, queue: .main) { (_) in
                self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
            }
        }
    }
}

struct StarterScreen_Previews: PreviewProvider {
    static var previews: some View {
        StarterScreen()
    }
}
