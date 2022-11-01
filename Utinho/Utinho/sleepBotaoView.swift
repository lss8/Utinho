//
//  sleepBotaoView.swift
//  Utinho
//
//  Created by hubevandro on 27/10/22.
//

import SwiftUI

struct sleepBotaoView: View {
    @State private var showsono: Bool = false
    
    
    var body: some View {
        Button(){
            showsono.toggle()
        } label: {
            Image(showsono ? "BSonoDesativado" : "BSonoAtivado" )
        }
    }
}
