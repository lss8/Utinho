//
//  ContentView.swift
//  Utinho
//
//  Created by lss8 on 25/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            VStack(spacing: 32.0) {
                HStack(spacing: 58.0) {
                    VStack {
                        ProgressView(value: 1.0)
                        ProgressView(value: 0.75)
                        ProgressView(value: 0.5)
                    }
                    //.hidden()
                    .frame(width: 64, height: 96)
                    VStack {
                        Image("Ciclo_Placeholder")
                        Text("Menstruação")
                    }
                    Image("BSonoAtivado")
                }
                VStack {
                    Text("To falando alguma coisa aqui")
                        
                }
                .frame(width: 345, height: 110)
                .background(.gray)
                Image("Utinho")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                HStack(spacing: 24.0) {
                    Image("BMinigameAtivado")
                    Image("BGinecoAtivado")
                }
                VStack(spacing: 12.0) {
                    Image(systemName: "chevron.up")
                    Text("Kit de sobrevivência uterina")
                }
                .frame(width: 345, height: 80)
                .background(.gray)
            }
            .padding()
        }
        //.background(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
