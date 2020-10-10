//
//  ContentView.swift
//  SwiftUIMemo
//
//  Created by 윤진영 on 2020/10/06.
//

import SwiftUI

struct MemoListScene: View {
    //EnvironmentObject 특성을 추가
    //앞에서 MemoStore instance를 커스텀 공유데이터로 등록
    //view가 생성되는 시점에 공유데이터 목록을 확인하고
    //store 속성과 동일한 형식을 가진 객체가 등록되어 있다면
    //여기에 자동으로 저장해줌
    //swiftUI에서는 이런 방식으로 하나의 데이터를 여러 view에서 공유함
    @EnvironmentObject var store: MemoStore
    
    //Formatter 속성을 추가
    //store 속성과 마찬가지로 view가 생성되는 시점에 자동으로 초기화 됨
    @EnvironmentObject var formatter: DateFormatter
    
    //화면 이동
    //compose scene을 제어할 때 사용되는 속성
    @State var showComposer: Bool = false
    
    var body: some View {

        //List에 커서를 두고 command+shift+A를 누르면 Actions가 나옴
        NavigationView {
            //MemoStore에 저장되어있는 배열을 전달
            //클로저 추가
            //배열에 저장되어 있는 메모가 아래의 파라미터로 전달되는데
            List(store.list) { memo in
                MemoCell(memo: memo)
            }
            //Navigation bar에 title 표시
            //새로운 modifier 추가.
            //SwiftUI에서는 modifier라고 불리는 특별한 메소드를 활용해서 필요한 속성을 바꾸거나 뷰를 조작함
            .navigationBarTitle("내 메모")
            //파라미터 형식을 보면 binding이고 type 파라미터가 Bool
            //여기에 showComposer 속성을 전달할건데
            //그냥 전달하면 안되고 이름 앞에 $를 붙여야 함
            //그러면 값이 복사되는 것이 아니라 바인딩이 전달되는데
            //여기에서 전달한 속성은 ModalButton의 show 속성에 저장됨
            //바인딩이 저장되기 때문에 self.show = true로 show 속성을 바꾸면 바인딩 되어있는 showComposer 속성을 바꾸게 됨
            //뷰 외부의 속성을 바꾸고 싶으면 바인딩 형태로 전달해야 함
            //파라미터로 전달할 때에는 $를 붙이고
            //전달받는 쪽에서는 @Binding 특성으로 선언하는 패턴
            .navigationBarItems(trailing: ModalButton(show: $showComposer))
            //sheet연산자는 binding되어있는 속성에 true가 저장되면
            //content 클로저가 실행되고 return된 화면을 modal 방식으로 표시함
            .sheet(isPresented: $showComposer, content: {
                ComposeScene(showComposer: self.$showComposer)
                    .environmentObject(self.store)
            })
        }
        
    }
}

fileprivate struct ModalButton: View{
    //값을 직접 저장하는 속성이 아니라 다른 곳에 있는 속성을 바꾸기 위한 속성
    @Binding var show: Bool
    
    var body: some View{
        Button(action: {
            self.show = true
        }, label: {
            //label 클로저에서는 sfSymbol 중에서 +이미지를 return
            Image(systemName: "plus")
        })
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
        //preview에서 사용할 MemoStore를 커스텀 공유데이터로 등록
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}


