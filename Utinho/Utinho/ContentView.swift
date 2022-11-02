//
//  ContentView.swift
//  Utinho
//
//  Created by lss8 on 25/10/22.
//

import SwiftUI

struct SelectedKitButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 97, height: 35)
            .background(Color.init(hex: "C74A4A"))
            .foregroundColor(Color.white)
    }
}

struct ContentView: View {
    //
    @StateObject var saudeProgress = BarProgressSaude() // instanciei a classe aqui criando um objeto
    @StateObject var nutricaoProgress = BarProgressSaude()
    @StateObject var lazerProgress = BarProgressSaude()
    @State private var showSheet: Bool = false
    @State private var showBars: Bool = false
    
    var body: some View {
        VStack() {
            VStack(spacing: 32.0) {
                HStack(spacing: 58.0) {
                    VStack {
                        HorizontalProgressBar(saudeBar: saudeProgress, alimentacaoBar: nutricaoProgress, lazerBar: lazerProgress)
                    }
                    .opacity(showBars ? 1 : 0)
                    .frame(width: 64, height: 96)
                    DayCounterView()
                    Image("BSonoAtivado")
                }
                VStack {
                    Text("To falando alguma coisa aqui")
                }
                .frame(width: 345, height: 110)
                .background(.gray)
                
                UtiView()
                
                HStack(spacing: 24.0) {
                    Image("BMinigameAtivado")
                    Image("BGinecoAtivado")
                }
                VStack(spacing: 12.0) {
                    Image(systemName: "chevron.up")
                    Button("Kit de sobrevivência uterina") {
                        showSheet.toggle()
                        showBars.toggle()
                    }
                    .sheet(isPresented: $showSheet) {
                        KitSobrevivenciaView(saudeProgress : saudeProgress, nutricaoProgress: nutricaoProgress, lazerProgress: lazerProgress)
                            .presentationDetents([.fraction(0.40)])
                        }
                }
                
                }
//                .frame(width: 345, height: 80)
//                .background(.red)
            }
            .padding()
        }
        
    }




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class BarProgressSaude: ObservableObject { // comecei aqui criando a classe
    @Published var value = 40.0       // aqui inicializa o valor da barra
}


