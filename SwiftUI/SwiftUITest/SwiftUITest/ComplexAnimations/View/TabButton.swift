//
//  TabButton.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/12/02.
//

import SwiftUI

struct TabButton: View {
    
    var title: String
    @Binding var selected: String
    
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()){
                selected = title
            }
        }) {
            Text(title)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(selected == title ? .white : .black)
                .padding(.vertical, 10)
                .padding(.horizontal, selected == title ? 20 : 0)
                .background(
                    
                    //For Slide Effect Animation
                    
                    ZStack{
                        if selected == title{
                            Color.black
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                
                )
        }
    }
}

//struct TabButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TabButton()
//    }
//}
