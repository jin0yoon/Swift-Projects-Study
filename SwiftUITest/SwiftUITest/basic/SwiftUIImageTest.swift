//
//  SwiftUIImageTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/09/29.
//

import SwiftUI

struct SwiftUIImageTest: View {
    var body: some View {
//        Image("images (1)") //이미지 불러오기
        
        //SF Symbol
//        Image(systemName: "circle")
        
        //UIImage 불러오기
//        guard let img = UIImage(named: "images (1)") else{
//            fatalError("Fail to load image")
//        }
//        return Image(uiImage: img)
        
        //foregroundColor(.color-name)
//        Image(systemName: "images (1)")
//            .foregroundColor(.blue)
        
//        Image("images (1)")
//            .resizable()
//            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)  //이미지 채우기
        
        //그라데이션
//        Text("SwiftUI tutorial by Munon")
//            .background(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
        
        //사각형
//        Circle()
//            .fill(Color.blue)
//            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        //배경
        Text("SwiftI tutorial by Munon")
            .background(Image("images (1)")
                            .resizable()
                            .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
    }
}

struct SwiftUIImageTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIImageTest()
    }
}
