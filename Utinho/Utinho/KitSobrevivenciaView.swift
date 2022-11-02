//
//  KitSobrevivenciaView.swift
//  Utinho
//
//  Created by michellyes on 28/10/22.
//

import SwiftUI


struct KitSobrevivenciaView: View {
    @State private var saudeIsSelected = true
    @State private var nutriçaoIsSelected = false
    @State private var lazerIsSelected = false
    @ObservedObject var saudeProgress: BarProgressSaude
    @ObservedObject var nutricaoProgress: BarProgressSaude
    @ObservedObject var lazerProgress: BarProgressSaude
    
    
    var imagesSaude: [String] = ["Anticoncepcional", "Camisinha", "Calcinha", "Coletor"]
    var imagesSaude2: [String] = ["Absorvente", "Pilula", "Compressa", "RemedioColica"]
    var imagesNutricao1: [String] = ["Agua","Cha","Cupnoodles","Abacate"]
    var imagesNutricao2: [String] = ["Chocolate","Banana","Sushi","Cafe"]
    var imagesLazer1: [String] = ["Games","Livro","Spaday","Piscininha"]
    var imagesLazer2: [String] = ["Festa","Datezinho","Bike","Netflix"]
    
    var body: some View {
        
        VStack {
            
            //MARK: Stack botões
            HStack {
                ButtonKitSelect(
                    isSelected: $saudeIsSelected,
                    backgroundColor: Color.init(hex: "A31017"),
                    textColor: .white,
                    textButton: "Saúde",
                    imageButton1: "IconeSaude",
                    imageButton2: "IconeSaudeRed")
                .onTapGesture {
                    if (saudeIsSelected == false){
                        saudeIsSelected.toggle() // aqui troca de true p false, e vice e versa
                        
                        if saudeIsSelected {
                            nutriçaoIsSelected = false
                            lazerIsSelected = false
                        }
                    }
                    
                }
                
                ButtonKitSelect(
                    isSelected: $nutriçaoIsSelected,
                    backgroundColor: Color.init(hex: "A31017"),
                    textColor: .white,
                    textButton: "Nutrição",
                    imageButton1: "IconeAlimentacao",
                    imageButton2: "IconeAlimentacaoRed")
                .onTapGesture {
                    if(nutriçaoIsSelected == false){
                        nutriçaoIsSelected.toggle()
                        
                        if nutriçaoIsSelected {
                            saudeIsSelected = false
                            lazerIsSelected = false
                        }
                    }
                    
                }
                
                ButtonKitSelect(
                    isSelected: $lazerIsSelected,
                    backgroundColor: Color.init(hex: "A31017"),
                    textColor: .white,
                    textButton: "Lazer",
                    imageButton1: "IconeLazer",
                    imageButton2: "IconeLazerRed")
                .onTapGesture {
                    if(!lazerIsSelected){ // mesma coisa de fazer um if(lazerIsSelected == false)
                        lazerIsSelected.toggle()
                        
                        if lazerIsSelected {
                            saudeIsSelected = false
                            nutriçaoIsSelected = false
                        }
                        
                    }
                    
                }
            }
            
            //MARK: Stack de itens
            VStack {
                HStack {
                    ForEach (0..<4, id: \.self) { index in
                        ItemKit(image: saudeIsSelected ? imagesSaude[index] : nutriçaoIsSelected ? imagesNutricao1[index] : imagesLazer1[index], saudeProgress: saudeProgress, nutricaoProgress: nutricaoProgress, lazerProgress: lazerProgress)
                    
                    }
                }
                
                HStack {
                    ForEach (0..<4, id: \.self) { index in
                        ItemKit(image: saudeIsSelected ? imagesSaude2[index] : nutriçaoIsSelected ? imagesNutricao2[index] : imagesLazer2[index], saudeProgress: saudeProgress, nutricaoProgress: nutricaoProgress, lazerProgress: lazerProgress)
                    }
                }
                
            }
            
            //MARK: Stack da seta
            HStack{
                Image(systemName: "chevron.down")
                    .padding()
                
            }
            
            
            
        }
    }
    
    
    struct KitSobrevivenciaView_Previews: PreviewProvider {
        static var previews: some View {
            KitSobrevivenciaView(saudeProgress: BarProgressSaude(), nutricaoProgress: BarProgressSaude(), lazerProgress: BarProgressSaude())
        }
    }
}
