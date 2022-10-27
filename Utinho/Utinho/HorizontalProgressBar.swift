//
//  HorizontalProgressBar.swift
//  Utinho
//
//  Created by michellyes on 27/10/22.
//

import SwiftUI

struct HorizontalProgressBar: View {
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                    .frame(width: 63.0, height: 28.0)
                .foregroundColor(Color.red.opacity(0.42))
                
                RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                    .frame(width: 27.0, height: 28.0)
                    .foregroundColor(Color.init(hue: 195, saturation: 46, brightness: 87))
            }
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                    .frame(width: 63.0, height: 28.0)
                .foregroundColor(Color.red.opacity(0.42))
                
                RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                    .frame(width: 33.0, height: 28.0)
                    .foregroundColor(Color.init(hue: 195, saturation: 46, brightness: 87))
            }
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                    .frame(width: 63.0, height: 28.0)
                .foregroundColor(Color.red.opacity(0.42))
                
                RoundedRectangle(cornerRadius: 8.13, style: .continuous)
                    .frame(width: 43.0, height: 28.0)
                    .foregroundColor(Color.init(hue: 195, saturation: 46, brightness: 87))
            }
        }
    }
}

struct HorizontalProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProgressBar()
    }
}
