//
//  ItemKit.swift
//  Utinho
//
//  Created by michellyes on 28/10/22.
//

import SwiftUI

struct ItemKit: View {
    var image: String
    
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
            print("1")
        case "Camisinha":
            print("2")
        case "Calcinha":
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
            ItemKit(image: "Compressa")
        }
    }
}

