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
                        Text("To falando alguma coisa aqui")
                    }
                    .frame(width: 345, height: 110)
                    .background(.gray)
                    Image("Utinho")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    HStack(spacing: 24.0) {
                        MinigameBotaoView()
                        GinecoBotaoView()
                    }
                    VStack(spacing: 12.0) {
                        Button() {
                            showSheet.toggle()
                        }label: {
                            Image ("KitBar")
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                        }
                        .padding(0.0)
                        .frame(height: 80.0)
                        .sheet(isPresented: $showSheet) {
                                KitSobrevivenciaView()
                                .presentationDetents([.fraction(0.40)])
                            }
                    }
                    
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

