//
//  ModifyRecipePost.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/27.
//

import SwiftUI

struct ModifyRecipePost: View {
    
    @Binding var recipeTitle:String
    
    var body: some View {
        VStack{
            HStack{
                Text("This will contain the images").frame(height:80)
            }
            TextField("Name your masterpiece", text: $recipeTitle).padding()
            TextField("Give it a description", text: $recipeTitle).padding()
//            List(){
//                ForEach
//            }
            Spacer()
        }
    }
}

struct ModifyRecipePost_Previews: PreviewProvider {
    
    static var previews: some View {
        ModifyRecipePost(recipeTitle: .constant("abc"))
    }
}
