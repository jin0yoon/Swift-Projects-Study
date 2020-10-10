//
//  ComposeScene.swift
//  SwiftUIMemo
//
//  Created by 윤진영 on 2020/10/09.
//

import SwiftUI

struct ComposeScene: View {
    //MemoStor 속성을 선언
    @EnvironmentObject var store: MemoStore
    //입력한 텍스트를 바인딩하는데 사용하는 속성 선언 -> 주로 State 속성으로 선언
    @State private var content: String = ""
    
    @Binding var showComposer: Bool
    
    //keyboardObserver를 주입할 속성 선언
    @EnvironmentObject var keyboard: KeyboardObserver
    
    var body: some View {
        NavigationView {
            VStack {
                //첫번째 파라미터는 빈 문자를 전달하고
                //두번째 파라미터에는 $를 붙여서 content속성을 전달
                //이렇게 하면 content속성과 textfield가 바인딩되고
                //textfield에 문자를 입력하면 content속성에 자동으로 저장
                //반대로 content 속성에 문자열을 저장하면 textfield에도 동일한 문자열이 표시됨
                TextView(text: $content)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    //context 속성은 published 특성으로 선언했으므로
                    //속성에 저장된 값이 업데이트되면 padding도 함께 업데이트 됨
                    .padding(.bottom, keyboard.context.height)
                    .animation(.easeInOut(duration: keyboard.context.animationDuration))
//                    .background(Color.yellow)
                //swiftUI에서는 view를 container 중앙에 배치함
            }
            //.infinity -> 사용가능한 최대 크기
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle("새 메모", displayMode: .inline)   //largeTitle 모드를 비활성화
            
            //버튼을 생성자만 호출하여 바로 전달
            .navigationBarItems(leading: DismissButton(show: $showComposer), trailing: SaveButton(show: $showComposer, content: $content))
        }
    }
}

//코드의 가독성을 위해 Button을 별도의 view로 빼서 파라미터로 전달하는 부분을 최대한 간단하게 작성해야 함
//취소 버튼
fileprivate struct DismissButton: View{
    @Binding var show: Bool
    
    var body: some View{
        Button(action: {
            self.show = false
        }, label: {
            Text("취소")
        })
    }
}
//저장 버튼
fileprivate struct SaveButton: View{
    @Binding var show: Bool
    
    //입력한 텍스트와 MemoStore에 접근해야 함
    //두 요소를 받은 속성 선언
    //MemoStore는 자동으로 주입되도록
    @EnvironmentObject var store: MemoStore
    @Binding var content: String
    
    var body: some View{
        Button(action: {
            
            //입력한 내용 저장
            self.store.insert(memo: self.content)
            
            self.show = false
        }, label: {
            Text("저장")
        })
    }
}

struct ComposeScene_Previews: PreviewProvider {
    static var previews: some View {
        //preview에서 에러가 발생하지 않도록 생성자로 속성을 전달
        //여기로 전달할 수 있는 속성이 없음
        //그런경우 보통 constant 바인딩을 전달
        ComposeScene(showComposer: .constant(false))
            //MemoStore를 커스텀 공유데이터로 등록
            .environmentObject(MemoStore())
            .environmentObject(KeyboardObserver())
    }
}
