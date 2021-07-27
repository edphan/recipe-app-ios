//
//  RecipeTabView.swift
//  recipe list app
//
//  Created by Edward Phan on 2021-07-26.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView {
            Text("Featured")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            
            RecipeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
