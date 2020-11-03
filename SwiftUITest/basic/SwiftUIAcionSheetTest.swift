//
//  SwiftUIAcionSheetTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUIAcionSheetTest: View {
    //action sheet를 사용하기 위해서는 @State 변수가 필요
    //@State 변수에 false값을 할당
    @State var showingSheet = false
    
    var body: some View {
        //Action Sheet 형태
        //title -> action sheet의 큰 글씨 부분
        //message -> action sheet의 작은 글씨 부분
        //buttons -> 옵션 버튼들
//        ActionSheet(title: Text, message: Text?, buttons: [ActionSheet.Button])
        
        Button(action: {
            //변수의 값을 true로 변경해주는 button과
            //그 버튼에 action sheet 속성을 부여
            self.showingSheet = true
        }){
            Text("Show Action Sheet")
        }
        .actionSheet(isPresented: $showingSheet){
            //action sheet 속성에 ActionSheet view를 생성
            ActionSheet(title: Text("Title"), message: Text("message"), buttons: [.default(Text("Dismiss")), .cancel(Text("Cancle"))])
        }
    }
}

struct SwiftUIAcionSheetTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAcionSheetTest()
    }
}
