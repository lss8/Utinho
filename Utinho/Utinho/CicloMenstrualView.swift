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
    @State var showPopUp: Bool = false
        
    var body: some View {
        ZStack { 
            Circle()
                .stroke(
                    Color.pink.opacity(0.5),
                    lineWidth: 10
                )
                .frame(width: 85, height: 85)
            Circle()
                .trim(from: 0, to: (1/28)*Double(dia))
                .stroke(
                    Color.pink,
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
        Button(changeFase(dia: dia)) {
            showPopUp = true
        }
        .foregroundColor(.white)
        .popover(isPresented: $showPopUp) {
            Image(changeFase(dia: dia))
                .background(BackgroundClearView())
                .onTapGesture {
                    showPopUp = false
                }
        }
        
    }
    
    func changeFase(dia: Int) -> String {
        var faseMenstrual: String
        
        if dia >= 1 && dia <= 5 {
            faseMenstrual = "Menstruação"
        }
        else if dia >= 6 && dia <= 11 {
            faseMenstrual = "Folicular"
        }
        else if dia >= 12 && dia <= 16 {
            faseMenstrual = "Ovularória"
        }
        else if dia >= 17 && dia <= 23 {
            faseMenstrual = "Lútea"
        }
        else {
            faseMenstrual = "TPM"
        }
        return faseMenstrual
    }
}

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
