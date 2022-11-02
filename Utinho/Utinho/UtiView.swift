//
//  UtiView.swift
//  Utinho
//
//  Created by lss8 on 02/11/22.
//

import SwiftUI

struct UtiView: View {
    
    var body: some View {
        VStack {
            Image("BODYBUILDER")
                .resizable()
                .frame(width: 330, height: 330)
                .foregroundColor(.accentColor)
        }
    }
    
    struct UtiView_Previews: PreviewProvider {
        static var previews: some View {
            UtiView()
        }
    }
}
