//
//  ButtonKitSelect.swift
//  Utinho
//
//  Created by michellyes on 31/10/22.
//

import SwiftUI



struct ButtonKitSelect: View {
    
    @Binding var isSelected: Bool
    @State var backgroundColor: Color
    @State var textColor: Color
    @State var textButton: String
    @State var imageButton1: String
    @State var imageButton2: String
   
    
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 97, height: 35)
                .foregroundColor(isSelected ? backgroundColor : Color.init(hex: "A31017").opacity(0.1))
                .cornerRadius(10)
            HStack{
                Image(isSelected ? imageButton1 : imageButton2 )
                Text(textButton)
                    .foregroundColor(isSelected ? textColor : Color.init(hex: "A31017"))
            }
        }
        
        
//            Button(action: {}){
//                HStack{
//                    Image(isSelected ? imageButton1 : "IconeSaudeRed")
//                    Text("Saúde")
//                }
//            }
//            .foregroundColor(isSelected ? textColor : Color.init(hex: "A31017"))
//            .frame(width: 97, height: 35)
//            .background(isSelected ? backgroundColor : Color.init(hex: "A31017").opacity(0.1))
//            .cornerRadius(10)
//            .padding(4)
        
       
            
        
    }
}

struct ButtonKitSelect_Previews: PreviewProvider {
    static var previews: some View {
        ButtonKitSelect(isSelected: .constant(false), backgroundColor: Color.init(hex: "A31017"), textColor: .white, textButton: "Teste", imageButton1: "IconeSaude", imageButton2: "IconeSaudeRed")
    }
}



//struct PrimaryButton: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .foregroundColor(Color.white)
//            .frame(width: 97, height: 35)
//            .background(Color.init(hex: "A31017"))
//            .cornerRadius(10)
//            .padding(4)
//    }
//}
//
//struct SecondaryButton: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .foregroundColor(Color.init(hex: "A31017"))
//            .frame(width: 97, height: 35)
//            .background(Color.init(hex: "A31017").opacity(0.1))
//            .cornerRadius(10)
//            .padding(4)
//
//    }
//}
