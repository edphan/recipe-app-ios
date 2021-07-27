//
//  DataService.swift
//  recipe list app
//
//  Created by Edward Phan on 2021-07-22.
//

import Foundation

// source for all the data fetching happens

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // parse local json file
        // get URL path to JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create URL Object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            // Create Data Object
            let data = try Data(contentsOf: url)
            
            // Decode data with jsondecoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add unique IDs for recipes
                for r in recipeData {
                    r.id = UUID()
                    
                    // Add unique IDs for ingredients in each recipe's ingredients array
                    for ingredient in r.ingredients {
                        ingredient.id = UUID()
                    }
                }
                
                // return [Recipe]
                return recipeData
                
            } catch {
                // error when decoding
                print(error)
            }
        } catch {
            // error for getting data
            print(error)
        }
        return [Recipe]()
    }
}
