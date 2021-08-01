//
//  RecipeHighlights.swift
//  recipe list app
//
//  Created by Edward Phan on 2021-08-01.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights: [String]) {
        
        // Loop through the highlights and build the string
        for index in 0..<highlights.count {
            
            // if this is the last index, don't add a comma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test1", "test2", "test3"])
    }
}
