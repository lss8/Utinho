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
    @StateObject var faseCiclo = FaseDoCiclo()
    @State private var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Image("Background_Menstruacao")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 16.0) {
                VStack(alignment: .center, spacing: 0.0) {
                    HStack(alignment: .center, spacing: 58.0) {
                        VStack {
                            HorizontalProgressBar(saudeBar: saudeProgress, alimentacaoBar: nutricaoProgress, lazerBar: lazerProgress)
                        }
                        .frame(width: 64, height: 96)
                        DayCounterView(fase: faseCiclo)
                        SleepBotaoView()
                    }
                    .padding(.horizontal, 0.0)
                }
                UtiView(fase: faseCiclo)
                HStack(spacing: 24.0) {
                    MinigameBotaoView()
                    GinecoBotaoView()
                }
                VStack(alignment: .center, spacing: 12.0) {
                    Button() {
                        showSheet.toggle()
                    }label: {
                        Image ("KitBar")
                            .resizable()
                            .frame(height: 80.0)
                            .edgesIgnoringSafeArea(.all)
                    }
                    .sheet(isPresented: $showSheet) {
                        KitSobrevivenciaView(saudeProgress : saudeProgress, nutricaoProgress: nutricaoProgress, lazerProgress: lazerProgress)
                            .presentationDetents([.fraction(0.40)])
                    }
                    .padding(.top, 22.0)
                    //                .frame(width: 345, height: 80)
                    //                .background(.red)
                }
                .padding()
            }
            .padding(.top, 56.0)
        }
        
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

class FaseDoCiclo: ObservableObject {
    @Published var fase = "Menstruação"
}

