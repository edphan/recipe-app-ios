//
//  RecipeFeaturedView.swift
//  recipe list app
//
//  Created by Edward Phan on 2021-07-27.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
             
                TabView {
                    
                    // Loop through the recipes array
                    ForEach(0..<model.recipes.count) { index in
                        
                        // Only show those are featured
                        if model.recipes[index].featured {
                            
                            // Recipe card button
                            Button(action: {
                                
                                // Show the recipe detail sheet
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                            })
                            .sheet(isPresented: $isDetailViewShowing) {
                                // Show the recipeDetailView
                                
                                RecipeDetailView(recipe: model.recipes[index])
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text("1 Hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, hearty")
            }
            .padding([.bottom, .leading])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
