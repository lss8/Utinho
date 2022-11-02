//
//  CicloMenstrualView.swift
//  Utinho
//
//  Created by lss8 on 27/10/22.
//

import SwiftUI

struct CicloMenstrualView: View {
    @Binding var dia: Int
    @State private var fase: String = "Menstruação"
        
    var body: some View {
        ZStack { // 1
            Circle()
                .stroke(
                    Color.pink.opacity(0.5),
                    lineWidth: 10
                )
                .frame(width: 85, height: 85)
            Circle() // 2
                .trim(from: 0, to: (1/28)*Double(dia))
                .stroke(
                    Color.init(hex: "77C3DD"),
                    style: StrokeStyle (
                        lineWidth: 10,
                        lineCap: .round
                    )
                )
                .frame(width: 85, height: 85)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: dia)
            Text("\(dia)/28")
        }
        Text(changeFase(dia: dia))
    }
    
    func changeFase(dia: Int) -> String {
        var faseMenstrual: String
        
        if dia >= 1 && dia <= 5 {
            faseMenstrual = "Menstruação"
        }
        else if dia >= 6 && dia <= 16 {
            faseMenstrual = "Ovulação"
        }   
        else {
            faseMenstrual = "Lútea"
        }
        return faseMenstrual
    }
}
