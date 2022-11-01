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
    
    
    struct ItemKit_Previews: PreviewProvider {
        static var previews: some View {
            ItemKit(image: "Compressa")
        }
    }
}

