//
//  DinamicGridView.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/20.
//

import SwiftUI

struct DinamicGridView: View {
    var body: some View {
        Home()
    }
}

struct DinamicGridView_Previews: PreviewProvider {
    static var previews: some View {
        DinamicGridView()
    }
}

struct Home: View {
    
    var body: some View{
        
        VStack(spacing:0){
            
            ZStack{
                HStack{
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 25, height: 23)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 22, height: 24)
                    })
                }
                
                Text("Games")
                    .font(.title)
                    .fontWeight(.bold)
                
            }
            .padding()
            
            Spacer()
            
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
    }
}
