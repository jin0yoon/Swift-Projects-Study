//
//  SwiftUIPreviewTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUIPreviewTest: View {
    var body: some View {
        Text("hi")
    }
}

//기본적으로 swiftUI의 preview는 각 swiftUI 파일 하단에 작성되어 있음
//xcode에서 처음 swiftUI 파일을 생성하면
//다음과 같은 코드가 하단에 있음
struct SwiftUIPreviewTest_Previews: PreviewProvider {
    static var previews: some View {
//        SwiftUIPreviewTest()
//            //다른 기기에서 preview하기 위해서는 다음과 같이 코드 변경
//            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        
        //여러 기기 preview 한번에
//        Group{
//            SwiftUIPreviewTest()
//                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
//
//            SwiftUIPreviewTest()
//                .previewDevice(PreviewDevice(rawValue: "iPhone XS"))
//        }
        
        //dark mode
        Group{
            SwiftUIPreviewTest()
                .preferredColorScheme(.dark)
            
            SwiftUIPreviewTest()
                .preferredColorScheme(.light)
        }
        
        
    }
}
