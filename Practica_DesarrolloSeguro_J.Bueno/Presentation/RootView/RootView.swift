//
//  RootView.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 20/5/24.
//

import SwiftUI

enum Status {
    case home, nextPrev(url:String), loading, loaded, error(error:String)
}

struct RootView: View {
    
    // MARK: Properties
    @StateObject var viewModel: HomeViewModel
    
    // MARK: View
    var body: some View {
        switch viewModel.status {
        case .home:
            Text("Status None")
                .onAppear {
                    viewModel.getPokemons()
                }
        case .nextPrev(url: let urlString):
            Text("Status Next Page")
                .onAppear {
                    viewModel.getPokemons(url: urlString)
                }
        case .loading:
            LoadingView()
        case .loaded:
            HomeView(homeViewModel: viewModel)
        case .error(error: let errorString):
            ErrorView(error: errorString) {
                viewModel.status = .home
            }
            
        }

    }
}

#Preview {
    RootView(viewModel: HomeViewModel())
}
