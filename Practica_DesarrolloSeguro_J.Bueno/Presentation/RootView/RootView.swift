//
//  RootView.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 20/5/24.
//

import SwiftUI

enum Status {
    case none, loading, loaded, error(error:String)
}

struct RootView: View {
    
    // MARK: Properties
    @StateObject var viewModel: HomeViewModel
    
    // MARK: View
    var body: some View {
        switch viewModel.status {
        case .none:
            Text("Status None")
                .onAppear {
                    viewModel.getPokemons()
                }
        case .loading:
            LoadingView()
        case .loaded:
            HomeView(homeViewModel: viewModel)
        case .error(error: let errorString):
            ErrorView(error: errorString) {
                viewModel.status = .none
            }
            
        }

    }
}

#Preview {
    RootView(viewModel: HomeViewModel())
}
