//
//  MeView.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/11.
//

import SwiftUI
import Firebase

struct MeView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        ZStack {
            VStack{
                HStack{
                    VStack{
                        Text("\(env.currentUser.name)")
                        Text("\(env.currentUser.username) || \(env.currentUser.publishedRecipes.count)")
                    }
                    Spacer()
                    Image(systemName: "timelapse")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .background(Color.yellow)
                        .cornerRadius(45)
                }.padding()
                
                HStack{
                    Button(action: {
                        
                    }, label: {
                        Spacer()
                        Text("Message")
                            .padding(3)
                            .foregroundColor(.black)
                        Spacer()
                            
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Spacer()
                        Text("Follow")
                            .padding(3)
                            .foregroundColor(.white)
                        Spacer()
                    })
                    .background(darkBlue)
                    .cornerRadius(5)
                }
                
                ScrollView{
                    VStack(spacing:0) {
                        ForEach(0..<env.currentUser.publishedRecipes.count){ i in
                            
                            Me_PostView()
                        }
                    }.background(Color.red)
                }
            }
            
        }.navigationBarTitle("").navigationBarHidden(true)
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
