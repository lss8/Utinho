//
//  CicloMenstrualView.swift
//  Utinho
//
//  Created by lss8 on 27/10/22.
//

import SwiftUI

struct CicloMenstrualView: View {
    @Binding var dia: Int
    @ObservedObject var fase: FaseDoCiclo
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
                .bold()
                .foregroundColor(.white)
        }
        Button(fase.fase) {
            showPopUp = true
        }
        .foregroundColor(.white)
        .bold()
        .popover(isPresented: $showPopUp) {
            Image(fase.fase)
                .background(BackgroundClearView())
                .onTapGesture {
                    showPopUp = false
                }
        }
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
