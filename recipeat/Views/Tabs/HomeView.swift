//
//  HomeView.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/11.
//

import SwiftUI

struct HomeView: View {
    
    var HomePosts: [recipePost] = [
        recipePost(postingUser: "person", description: "This is a long description.This is a long description.This is a long description.This is a long description.", numberOfLikes: 1122, image: Image(systemName: "timelapse"))
    ]
    
    var body: some View {
        
        VStack{
            ScrollView(.horizontal, showsIndicators:false){
                HStack{
                    Text("This is scrollable to the right and left")
                    Text("This is scrollable to the right and left")
                }.frame(height: 80)
            }.background(Color.red)
            ScrollView{
                ForEach(0..<50){_ in
                    Text("This is scrollable, up and down")
                }
                
                
            }.background(Color.blue)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
