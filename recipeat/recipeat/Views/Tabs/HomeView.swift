//
//  HomeView.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/11.
//

import SwiftUI

struct HomeView: View {
    
    var HomePosts: [recipePost] = [
        recipePost(steps: [], ingredients: [], postingUser: "person", description: "This is a long description.This is a long description.This is a long description.This is a long description.", numberOfLikes: 1122, image: Image(systemName: "timelapse")),
        recipePost(steps: [], ingredients: [], postingUser: "person2", description: "person2person2person2person2person2person2person2person2person2person2person2person2person2person2", numberOfLikes: 2122, image: Image(systemName: "timelapse")),
        recipePost(steps: [], ingredients: [], postingUser: "person3", description: "person3person3person3person3person3person3person3person3person3person3person3person3person3", numberOfLikes: 3122, image: Image(systemName: "timelapse")),
        recipePost(steps: [], ingredients: [], postingUser: "person4", description: "person4person4person4person4person4person4person4person4person4person4person4person4person4person4person4", numberOfLikes: 4122, image: Image(systemName: "timelapse")),
        recipePost(steps: [], ingredients: [], postingUser: "person5", description: "person5person5person5person5person5person5person5person5person5person5person5person5person5person5person5", numberOfLikes: 5122, image: Image(systemName: "timelapse"))
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
                ForEach(HomePosts, id: \.id){ post in
                    PostView(passed_postingUser: post.postingUser, passed_description: post.description, passed_numberOfLikes: post.numberOfLikes, passed_image: post.image)
                }
                
                
            }.background(Color.clear)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
