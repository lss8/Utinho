//
//  AnotherView.swift
//  testButton
//
//  Created by michellyes on 31/10/22.
//

import SwiftUI

struct AnotherView: View {
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .imageScale(.large)
                .foregroundColor(.green)
            Text("Hello, star!")
        }
        .padding()
    }
}

struct AnotherView_Previews: PreviewProvider {
    static var previews: some View {
        AnotherView()
    }
}
