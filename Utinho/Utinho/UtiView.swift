//
//  UtiView.swift
//  Utinho
//
//  Created by lss8 on 02/11/22.
//

import SwiftUI

struct UtiView: View {
    @ObservedObject var fase: FaseDoCiclo
    
    var body: some View {
        VStack {
            VStack {
                Text(changeText(faseCiclo: fase))
                    .bold()
                    .foregroundColor(Color.init(hex: "A31017"))
            }
            .padding(.horizontal, 4.0)
                .frame(width: 345, height: 110)
                .background(.white)
                .cornerRadius(20.0)
            Image(changeImage(faseCiclo: fase))
                .resizable()
                .frame(width: 330, height: 330)
                .foregroundColor(.accentColor)
        }
    }
    
    func changeText(faseCiclo: FaseDoCiclo) -> String {
        var texto: String
        
        switch faseCiclo.fase {
        case "Menstruação":
            texto = "Não to afim de sair hoje..."
        case "Folicular":
            texto = "Ô abestado é pra cliclar ali ó, ta vendo não?"
        case "Ovulatória":
            texto = "Qual o sextou de hoje?"
        case "Lútea":
            texto = "Hmmmm, to sentindo até meus chakras se alinhando de volta."
        default:
            texto = "OLHA, não me enche as trompas!!!!"
        }
        
        return texto
    }
    
    func changeImage(faseCiclo: FaseDoCiclo) -> String {
        var imagem: String
        
        switch faseCiclo.fase {
        case "Menstruação":
            imagem = "CASEIRO_TRISTE"
        case "Folicular":
            imagem = "FELIZ"
        case "Ovulatória":
            imagem = "SAIDINHO_OCULOS"
        case "Lútea":
            imagem = "BODYBUILDER"
        default:
            imagem = "PUTO"
        }
        
        return imagem
    }
    
    /*struct UtiView_Previews: PreviewProvider {
        static var previews: some View {
            UtiView()
        }
    }*/
}
