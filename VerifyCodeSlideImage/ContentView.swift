
//  ContentView.swift
//  VerifyCodeSlideImage
//
//  Created by Bhadresh on 16/08/23.
//

import SwiftUI

struct ContentView: View {
    let verifyManager = NTESVerifyCodeManager.getInstance()

    @StateObject private var delegateWrapper = VerifyCodeDelegateWrapper()

    var body: some View {
        VStack {
            Text("Your SwiftUI Content Here")

            Button(action: {
                print("On going")
                delegateWrapper.showVerificationView { isValid, token in
                    print("isValid:\(isValid) \ntoken:\(token ?? "")")
                }

            }, label: {
                Text("Verify Now")
                    .font(.title)
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
