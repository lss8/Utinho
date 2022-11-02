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
    
    var body: some View {
        ZStack {
            Image("Background_Menstruacao")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack() {
                VStack(alignment: .center, spacing: 24.0) {
                    HStack(alignment: .center, spacing: 58.0) {
                        VStack {
                            HorizontalProgressBar()
                        }
                        .frame(width: 64, height: 96)
                        DayCounterView()
                        SleepBotaoView()
                    }
                    .padding(0.0)
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
                
                HStack(spacing: 24.0) {
                        MinigameBotaoView()
                        GinecoBotaoView()
                }
                
                UtiView()
                
                VStack(spacing: 12.0) {
                    Button() {
                            showSheet.toggle()
                        }label: {
                            Image ("KitBar")
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                    }
                    .sheet(isPresented: $showSheet) {
                        KitSobrevivenciaView(saudeProgress : saudeProgress, nutricaoProgress: nutricaoProgress, lazerProgress: lazerProgress)
                            .presentationDetents([.fraction(0.40)])          
                }
                .padding(.top, 32.0)
    //                .frame(width: 345, height: 80)
    //                .background(.red)
                }
                .padding()
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


