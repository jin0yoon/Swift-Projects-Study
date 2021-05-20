//
//  ContentViewText.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/09/29.
//

import SwiftUI

struct SwiftUITextTest: View {
    var body: some View {
        Text("Hello, world! It is a wonderful place to lice. Blablaldddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd")
//            .lineLimit(5)
            .lineLimit(nil) //줄 제한을 없게 하려면
            .truncationMode(.head) //긴 문장의 경우 텍스트의 일부를 생략
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/) //폰트
            .multilineTextAlignment(.center) //여러줄 텍스트 정렬
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/) //텍스트의 색상 변경
            .background(Color.yellow) //텍스트의 음영색, 배경색을 변경
            .lineSpacing(10.0) //텍스트의 줄 간격
            //텍스트뷰 안에 표시되는 텍스트의 포맷을 설정하기 위해서는 formatter를 사용
           
   
    }
}

struct SwiftUITextTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextTest()
    }
}
