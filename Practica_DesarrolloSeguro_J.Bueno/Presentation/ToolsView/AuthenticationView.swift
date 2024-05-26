//
//  AuthenticationView.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 26/5/24.
//

import SwiftUI

struct AuthenticationView: View {
    
    var body: some View {
        ZStack {
            Image("fondo1")
                .resizable()
                
            Color.whiteBlack.opacity(0.4)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AuthenticationView()
}
