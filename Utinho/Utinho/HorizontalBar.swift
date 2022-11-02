//
//  HorizontalBar.swift
//  Utinho
//
//  Created by michellyes on 01/11/22.
//

import SwiftUI

struct HorizontalBar: View {
    
    var width: CGFloat = 63.0
    var height: CGFloat = 28.0
    
    @State var imageBar: String
    @ObservedObject var indiceBar: BarProgressSaude
    
    var body: some View {
        
        let multiplicador = width / 100
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.init(hex: "DC8B86").opacity(0.42))
            
            RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                .frame(width: indiceBar.value * multiplicador, height: 28.0)
                .foregroundColor(Color.init(hex: "77C3DD"))
            
            HStack {
                Image(imageBar)
            }.frame(width: 63.0, height: 28.0)
        }
    }
    
    struct HorizontalBar_Previews: PreviewProvider {
        static var previews: some View {
            HorizontalBar(imageBar: "IconeSaude", indiceBar: BarProgressSaude())
        }
    }
}
