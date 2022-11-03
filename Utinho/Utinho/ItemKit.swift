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
            saudeProgress.value -= 10.0
        case "Camisinha":
            saudeProgress.value += 10.0
            lazerProgress.value += 5.0
        case "Calcinha":
            saudeProgress.value += 10.0
        case "Coletor":
            saudeProgress.value += 10.0
        case "Absorvente":
            saudeProgress.value += 10.0
        case "Pilula":
            saudeProgress.value -= 10.0
        case "Compressa":
            saudeProgress.value += 10.0
        case "RemedioColica":
            saudeProgress.value += 10.0
        case "Agua":
            saudeProgress.value += 10.0
            nutricaoProgress.value += 10.0
        case "Cha":
            saudeProgress.value += 10.0
            nutricaoProgress.value += 10.0
        case "Cupnoodles":
            saudeProgress.value -= 5.0
            nutricaoProgress.value += 10.0
        case "Abacate":
            saudeProgress.value += 5.0
            nutricaoProgress.value += 10.0
        case "Chocolate":
            saudeProgress.value -= 10.0
            nutricaoProgress.value += 10.0
            lazerProgress.value += 5.0
        case "Banana":
            saudeProgress.value += 5.0
            nutricaoProgress.value += 10.0
        case "Sushi":
            saudeProgress.value += 5.0
            nutricaoProgress.value += 10.0
            lazerProgress.value += 5.0
        case "Cafe":
            saudeProgress.value -= 10.0
            nutricaoProgress.value += 10.0
        case "Games":
            lazerProgress.value += 10.0
        case "Livro":
            lazerProgress.value += 10.0
        case "Spaday":
            saudeProgress.value += 5.0
            lazerProgress.value += 10.0
        case "Piscininha":
            lazerProgress.value += 15.0
        case "Festa":
            lazerProgress.value += 10.0
        case "Datezinho":
            lazerProgress.value += 10.0
        case "Bike":
            saudeProgress.value += 5.0
            lazerProgress.value += 10.0
        case "Netflix":
            lazerProgress.value += 10.0
            
        default:
            saudeProgress.value += 0.0
            nutricaoProgress.value += 0.0
            lazerProgress.value += 0.0
        }
    }
    
    struct ItemKit_Previews: PreviewProvider {
        static var previews: some View {
            ItemKit(image: "Compressa", saudeProgress: BarProgressSaude(), nutricaoProgress: BarProgressSaude(), lazerProgress: BarProgressSaude())
        }
    }
}

