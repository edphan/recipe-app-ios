//
//  RecipeModel.swift
//  recipe list app
//
//  Created by Edward Phan on 2021-07-21.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
    }
}
