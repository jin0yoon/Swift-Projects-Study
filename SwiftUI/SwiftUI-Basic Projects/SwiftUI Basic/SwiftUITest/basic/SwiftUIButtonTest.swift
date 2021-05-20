//
//  SwiftUIButtonTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/02.
//

import SwiftUI

struct SwiftUIButtonTest: View {
    @State var showDetails = false
    var body: some View {
//        //일반적인 버튼 만드는 방법
//        //Button 다음에 action과 display 칸을 마련
//        Button(action: {
//            //action
//        }) {
//            //display
//            Text("Button")
//        }
        
        /*
         두개 이상의 View를 사용하기 위해서는
         VStack 혹은 HStack을 감싸면 된다.
         VStack은 Vertical Stack -> 세로 스택
         HStack은 Horizontal Stack  -> 가로 스택
         */
        VStack {
            Button(action: {
                //버튼을 누르면 showDetails의 값을 토글하고
                self.showDetails.toggle()
            }) {
                //버튼의 text
                Text("Show details")
            }
            //showDetails가 true이면 아래의 text를 보여준다.
            if showDetails {
                Text("You should see me in a crown")
                    .font(.largeTitle)
                    .lineLimit(nil)
            }
        }
        
    }
}

struct SwiftUIButtonTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIButtonTest()
    }
}
