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
                    Spacer().frame(width:10)
                    ForEach(0..<10){_ in
                        StoryCircleView()
                    }
                    Spacer().frame(width:10)
                }.frame(height: 80)
            }.background(Color.clear)
            ScrollView{
                ForEach(0..<10){_ in
                    PostView()
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
