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
    
    
    
    var imagesSaude: [String] = ["Anticoncepcional", "Camisinha", "Calcinha", "Coletor"]
    var imagesSaude2: [String] = ["Absorvente", "Pilula", "Compressa", "RemedioColica"]
    var imagesNutricao1: [String] = ["Camisinha","Camisinha","Camisinha","Camisinha"]
    var imagesNutricao2: [String] = ["Coletor","Coletor","Coletor","Coletor"]
    var imagesLazer1: [String] = ["Compressa","Compressa","Compressa","Compressa"]
    var imagesLazer2: [String] = ["Anticoncepcional","Anticoncepcional","Anticoncepcional","Anticoncepcional"]
    
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
                
    
                /*
                 MARK: OPERADOR TERNÁRIO
                 x ? z : y
                 
                 if (x == true){
                        z
                 }else{
                    if()
                 }
                 
                 //(image: saudeIsSelected ? imagesSaude[index] : (nutricaoIsSelected ? imagesNutricao : imagesAlmientacao) )
                 
                 if(saudeIsSeleted){
                    image: imagesSaude[index]
                 }else{
                    if(nutricaoIsSelected){
                        imagesNutricao
                    }else{
                        imagesAlimentacao
                    }
                 }
                 
                 image: saudeIsSeleted ? imagesSaude[index] : nutricaoIsSelected ? imagesNutricao[index] : imagesAlimentacao[index]
                 */
            }
            
            //MARK: Stack de itens
            VStack {
                HStack {
                    ForEach (0..<4, id: \.self) { index in
                        ItemKit(image: saudeIsSelected ? imagesSaude[index] : nutriçaoIsSelected ? imagesNutricao1[index] : imagesLazer1[index])
                    
                    }
                }
                
                HStack {
                    ForEach (0..<4, id: \.self) { index in
                        ItemKit(image: saudeIsSelected ? imagesSaude2[index] : nutriçaoIsSelected ? imagesNutricao2[index] : imagesLazer2[index])
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
            KitSobrevivenciaView()
        }
    }
}
