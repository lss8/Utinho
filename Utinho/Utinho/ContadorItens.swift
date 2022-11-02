//
//  ContadorItens.swift
//  Utinho
//
//  Created by michellyes on 29/10/22.
//

import SwiftUI

struct ContadorItens: View {
    var body: some View {
        ZStack(alignment: .center){
            
            RoundedRectangle(cornerRadius: 7.0, style: .continuous)
                .frame(width: 30, height: 30)
                .foregroundColor(Color.white)
            
            
            HStack{
                Text("5")
                    .foregroundColor(Color.init(hex: "A31017"))
                    .font(.system(size: 13))
                Image("GotaSangue")
            }
        }//.background(Color.red)
    }
    
    struct ContadorItens_Previews: PreviewProvider {
        static var previews: some View {
            ContadorItens()
        }
    }
}
