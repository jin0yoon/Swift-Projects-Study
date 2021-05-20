//
//  SwiftUIListEditTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUIListEditTest: View {
    @State var users = ["munon", "gomin", "durup"]
    
    var body: some View {
        //리스트 아이템 편집
        //리스트 아이템을 편집하기 위해서는
        //편집 버튼과 편집 상태에서 작동하는 함수의 정의가 필요
        //우선 네비게이션 바 아이템으로 편집 버튼을 만들고,
        //.onMove(perform:) 으로 편집 상태에 진입 했을 때 작동할 함수를 부여
        NavigationView{
            List{
                ForEach(users, id: \.self){
                    user in Text(user)
                }
                //.onMove(perform:) 으로 편집 상태에 진입 했을 때 작동할 함수를 부여
                .onMove(perform: move)
            }
            //네비게이션 바 아이템으로 편집 버튼 만듬
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    //편집 상태에서 실행할 함수를 정의해줌
    func move(from source: IndexSet, to destination: Int){
        let reversedSource = source.sorted()
        for index in reversedSource.reversed(){
            users.insert(users.remove(at: index), at: destination)
        }
    }
}

struct SwiftUIListEditTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIListEditTest()
    }
}
