//
//  ItemKit.swift
//  Utinho
//
//  Created by michellyes on 28/10/22.
//

import SwiftUI

struct ItemKit: View {
    var image: String
    
    @ObservedObject var saudeProgress: BarProgressSaude
    @ObservedObject var nutricaoProgress: BarProgressSaude
    @ObservedObject var lazerProgress: BarProgressSaude
    
    var body: some View {
        
        ZStack{
            
            Circle()
                .frame(width: 65, height: 65)
                .foregroundColor(Color.gray.opacity(0.3))
            
            Image(image)
                .onTapGesture {
                    addToBar(item: image)
                }
            
            ZStack(alignment: .bottomTrailing){
                RoundedRectangle(cornerRadius: 1)
                    .frame(width: 79, height:83)
                    .foregroundColor(Color.gray.opacity(0))
                
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.gray.opacity(0))
                
                ContadorItens()
            }
            
        }
    }
    
    public func addToBar(item: String) {
        switch item {
        case "Anticoncepcional":
            saudeProgress.value = saudeProgress.value - 10.0
            nutricaoProgress.value = 70.0
            lazerProgress.value = 100.0
            print("1")
        case "Camisinha":
            saudeProgress.value = 50.0
            nutricaoProgress.value = 30.0
            lazerProgress.value = 30.0
            print("2")
        case "Calcinha":
            saudeProgress.value = 60.0
            nutricaoProgress.value = 40.0
            lazerProgress.value = 80.0
            print("3")
        case "Coletor":
            print("4")
        case "Absorvente":
            print("5")
        case "Pilula":
            print("6")
        case "Compressa":
            print("7")
        case "RemedioColica":
            print("8")
        default:
            print("clicou em outro")
        }
    }
    
    struct ItemKit_Previews: PreviewProvider {
        static var previews: some View {
            ItemKit(image: "Compressa", saudeProgress: BarProgressSaude(), nutricaoProgress: BarProgressSaude(), lazerProgress: BarProgressSaude())
        }
    }
}

