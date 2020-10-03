//
//  SwiftUIViewTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/03.
//

import SwiftUI

struct SwiftUIViewTest: View {
    var body: some View {
        //body는 하나의 view를 리턴해야 하기 때문에 성립이 되지 않음
//        Text("SwiftUI")
//        Text("Munon")
        
        //두 개 이상의 뷰를 사용하기 위해서는
        //VStack 혹은 HStack으로 감싸면 됨
        //VStack -> Vertical stack -> 세로
        //HStack -> Horizontal stack -> 가로
//        VStack{
//            Text("SwiftUI")
//            Text("Munon")
//        }
//        HStack{
//            Text("SwiftUI")
//            Text("Munon")
//        }
        
        //스택 안에 있는 뷰들 간의 간격을 주기 위해서는
        //spacing을 사용
//        VStack(spacing: 50){
//            Text("SwiftUI")
//            Text("Munon")
//        }
        
        //적당한 간격을 주는 또 다른 방법에는 Divider()도 있음
//        VStack{
//            Text("SwiftUI")
//            Divider()
//            Text("Munon")
//        }
        
        //스택 안에 있는 뷰를 정렬하기 위해서는
        //alignment를 사용하면 됨
//        VStack(alignment: .leading){
//            Text("SwiftUI")
//            Divider()
//            Text("Munon")
//        }
        
        //뷰 사이에 간격 주기
        
//        //적당한 간격을 주기 위해서는 padding()을 사용
//        //padding에 인자 값을 전달하지 않으면 시스템 기본값으로 자동 적용되고,
//        VStack{
//            Text("SwiftUI")
//                .padding()
//            Text("Munon")
//        }
//        //인자값을 전달하면, 다음과 같이 원하는 위치에 원하는 간격을 줄 수 있음
//        VStack{
//            Text("SwiftUI")
//                .padding(.bottom, 100)
//            Text("Munon")
//        }
        
        //ZStack은 또 다른 스택 뷰로, 뷰를 겹칠 때 사용
        //아래와 같이 하면 이미지와 텍스트가 포개짐
//        ZStack(){
//            Image("images (1)")
//            Text("Munon")
//        }
        
        //다양한 뷰 타입 리턴
        //some View는 특정한 하나의 뷰 타입이 리턴한다고 이해함
        //그렇기 때문에 다음과 같은 다양한 뷰 타입을 한 번에 리턴할 수 없음
//        if Bool.random() {
//            Image("images (1)")
//        }else{
//            Text("fail")
//        }
        
        //위와 같은 상황을 해결하는 1번째 방법은 Group으로 감싸주는 것
//        Group{
//            if Bool.random() {
//                Image("images (1)")
//            }else{
//                Text("fail")
//            }
//        }
        
        //2번째 방법은 AnyView로 각각의 View를 감싸서
        //특정한 리턴 View 타입을 없애는 것
//        if Bool.random() {
//            return AnyView(Image("images (1)"))
//        }else{
//            return AnyView(Text("fail"))
//        }
        
        //Safe Area
        //기본적으로 SwiftUI의 View는 Safe Area 안에 배치됨
        //Safe Area를 넘고 싶다면, 다음 명령어를 사용
        Text("Hello World")
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color.yellow)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct SwiftUIViewTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewTest()
    }
}
