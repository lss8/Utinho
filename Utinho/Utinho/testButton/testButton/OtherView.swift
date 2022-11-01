//
//  OtherView.swift
//  testButton
//
//  Created by michellyes on 31/10/22.
//

import SwiftUI

struct OtherView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.green)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
