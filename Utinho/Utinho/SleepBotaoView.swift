//
//  SleepBotaoView.swift
//  Utinho
//
//  Created by lss8 on 02/11/22.
//

import SwiftUI

struct SleepBotaoView: View {
    @State private var showsono: Bool = false
    
    
    var body: some View {
        Button(){
            showsono.toggle()
        } label: {
            Image(showsono ? "BSonoDesativado" : "BSonoAtivado" )
        }
    }
}
