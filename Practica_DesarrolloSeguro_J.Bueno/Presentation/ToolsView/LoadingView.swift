//
//  LoadingView.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 20/5/24.
//

import SwiftUI

struct LoadingView: View {
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            Image("fondo1")
                .resizable()
                
            Color.whiteBlack.opacity(0.4)
            
            VStack{
                
                ProgressView(value: isLoading ? 1.0 : nil) {
                    
                    Text(NSLocalizedString("Loading", comment: ""))
                        .foregroundColor(.blue)
                }
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2.5)
                    .onAppear {
                        withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                            isLoading = true
                        }
                    }
                    .tint(.blue)
            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    LoadingView()
}
