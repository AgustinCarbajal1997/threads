//
//  ExplorerView.swift
//  treads
//
//  Created by Agustin Carbajal on 20/11/2023.
//

import SwiftUI

struct ExplorerView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = ExplorerViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) {
                        user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                .padding(.horizontal)
                                Divider()
                            }
                            .padding(.vertical, 2)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: {
                user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

struct ExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorerView()
    }
}
