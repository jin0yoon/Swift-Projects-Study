//
//  SwiftUIListDeleteTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUIListDeleteTest: View {
    @State var users = ["munon", "gomin", "durup"]
    
    var body: some View {
        //리스트 아이템 삭제
        //ForEach로 뿌려진 Text 아이템 뒤에 .onDelete(perform:)을 달아줌
        //그리고 삭제 버튼을 누르면 실행할 함수를 정의
        List{
            ForEach(users, id: \.self){
                user in Text(user)
            }
            .onDelete(perform: delete)
        }
    }
    
        func delete(at offsets: IndexSet){
            if let first = offsets.first{
                users.remove(at: first)
            }
        }
}

struct SwiftUIListDeleteTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIListDeleteTest()
    }
}
