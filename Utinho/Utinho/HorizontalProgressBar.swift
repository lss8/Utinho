//
//  HorizontalProgressBar.swift
//  Utinho
//
//  Created by michellyes on 27/10/22.
//

import SwiftUI

struct HorizontalProgressBar: View {
    
    var width: CGFloat = 63.0
    var height: CGFloat = 28.0
    var indiceSaude: CGFloat = 33.0
    var indiceAlimentacao: CGFloat = 53.0
    var indiceLazer: CGFloat = 73.0
    
    var body: some View {
        
        let multiplicador = width / 100
        
    
        VStack {
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                    .frame(width: width, height: height)
                    .foregroundColor(Color.init(hex: "DC8B86").opacity(0.42))
                
                RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                    .frame(width: indiceSaude * multiplicador, height: 28.0)
                    .foregroundColor(Color.init(hex: "328AA8"))
                
                HStack {
                    Image("IconeSaude")
                }.frame(width: 63.0, height: 28.0)
            }
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                    .frame(width: width, height: height)
                .foregroundColor(Color.init(hex: "DC8B86").opacity(0.42))

                RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                    .frame(width: indiceAlimentacao * multiplicador, height: 28.0)
                    .foregroundColor(Color.init(hex: "77C3DD"))
                
                HStack {
                    Image("IconeAlimentacao")
                }.frame(width: 63.0, height: 28.0)
            }
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                    .frame(width: width, height: height)
                .foregroundColor(Color.init(hex: "DC8B86").opacity(0.42))

                RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                    .frame(width: indiceLazer * multiplicador, height: 28.0)
                    .foregroundColor(Color.init(hex: "77C3DD"))
                
                HStack {
                    Image("IconeLazer")
                        
                }.frame(width: 63.0, height: 28.0)
                    
            }
        }
    }
}







struct HorizontalProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProgressBar()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
