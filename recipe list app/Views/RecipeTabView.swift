//
//  RecipeTabView.swift
//  recipe list app
//
//  Created by Edward Phan on 2021-07-26.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var selectedTab = Constants.featutedTab
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            RecipeFeaturedView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
                .tag(Constants.featutedTab)
            
            RecipeCategoryView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Categories")
                }
                .tag(Constants.categoryTab)
            
            RecipeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
                .tag(Constants.listTab)
            
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
