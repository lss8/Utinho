//
//  ContentView.swift
//  testButton
//
//  Created by michellyes on 31/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var tela: any View = OtherView()
    
    var body: some View {
        
        VStack {
            
            any View(tela)
            
            Button(action: {}, label: {}){
                
            }
            .padding()
            .accentColor(.white)
            .background(Color.green)
            .cornerRadius(10)
            
            
            
            
            
           
        }
        .padding()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
