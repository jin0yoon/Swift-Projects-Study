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
    
    var body: some View {

        //List에 커서를 두고 command+shift+A를 누르면 Actions가 나옴
        NavigationView {
            //MemoStore에 저장되어있는 배열을 전달
            //클로저 추가
            //배열에 저장되어 있는 메모가 아래의 파라미터로 전달되는데
            List(store.list) { memo in
                Text(memo.content)  //일단 텍스트로 메모 내용을 출력
            }
            //Navigation bar에 title 표시
            //새로운 modifier 추가.
            //SwiftUI에서는 modifier라고 불리는 특별한 메소드를 활용해서 필요한 속성을 바꾸거나 뷰를 조작함
            .navigationBarTitle("내 메모")
        }
        
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
        //preview에서 사용할 MemoStore를 커스텀 공유데이터로 등록
            .environmentObject(MemoStore())
    }
}
