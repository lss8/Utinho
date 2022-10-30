//
//  KitSobrevivenciaView.swift
//  Utinho
//
//  Created by michellyes on 28/10/22.
//

import SwiftUI

struct KitSobrevivenciaView: View {
    
    var images: [String] = ["Anticoncepcional", "Camisinha", "Calcinha", "Coletor"]
    var images2: [String] = ["Absorvente", "Pilula", "Compressa", "RemedioColica"]
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {}){
                    HStack{
                        Image("IconeSaude")
                        Text("Saúde")
                    }
                }
                .foregroundColor(Color.white)
                .frame(width: 97, height: 35)
                .background(Color.init(hex: "A31017"))
                .cornerRadius(10)
                
                Button(action: {}){
                    HStack{
                        Image("IconeAlimentacaoRed")
                        Text("Nutrição")
                    }
                }
                .foregroundColor(Color.init(hex: "A31017"))
                .frame(width: 97, height: 35)
                .border(Color.init(hex: "A31017"))
                .cornerRadius(10)
                
                Button(action: {}){
                    HStack{
                        Image("IconeLazerRed")
                        Text("Lazer")
                    }
                }
                .foregroundColor(Color.init(hex: "A31017"))
                .frame(width: 97, height: 35)
                .border(Color.init(hex: "A31017"))
                .cornerRadius(14)
                
                
            }
            
            VStack {
                HStack {
                    ForEach (0..<4, id: \.self) { index in
                        ItemKit(image: images[index])
                    }
                }
                
                HStack {
                    ForEach (0..<4, id: \.self) { index in
                        ItemKit(image: images2[index])
                    }
                }
                
            }
            
            
            HStack{
                Image(systemName: "chevron.down")
                    .padding()
                
            }
            
            
            
        }
    }
    
    
    struct KitSobrevivenciaView_Previews: PreviewProvider {
        static var previews: some View {
            KitSobrevivenciaView()
        }
    }
}
