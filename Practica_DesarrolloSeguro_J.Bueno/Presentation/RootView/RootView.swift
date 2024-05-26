//
//  RootView.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 20/5/24.
//

import SwiftUI

enum Status {
    case none, home, nextPrev(url:String), loading, loaded, error(error:String)
}

struct RootView: View {
    
    // MARK: Properties
    @StateObject var viewModel: HomeViewModel
    
    // MARK: View
    var body: some View {
        switch viewModel.status {
        case .none:
            AuthenticationView()
                .onAppear {
                    viewModel.authentication.authenticateUser { succes in
                        if succes {
                            viewModel.status = .home
                        } else {
                            viewModel.status = .error(error: NSLocalizedString("AUTHENTICATION ERROR", comment: ""))
                        }
                    }
                }
        case .home:
            Text("Status Home")
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
                viewModel.status = .none
            }
        }
    }
}

#Preview {
    RootView(viewModel: HomeViewModel())
}
