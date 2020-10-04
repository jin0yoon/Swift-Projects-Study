//
//  SwiftUIListTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

//정적 리스트
//FamilyRow라는 struct가 있음
//이 struct는 name변수와 Text를 리턴하는 body를 가지고 있음
struct FamilyRow: View {
    var name: String
    var body: some View{
        Text("Family: \(name)")
    }
}

struct SwiftUIListTest: View {
    var body: some View {
        //리스트(List)란
        //리스트는 이름 그대로 목록 인터페이스를 구현하기 위해 존재
        //SwiftUI의 리스트는 UIKit의 UITableView와 하는 일이 비슷함
        
        //정적 리스트
        //List의 아이템으로 FamilyRow를 넣어주고
        //각각의 FamilyRow에 서로 다른 name을 입력해준다.
        List{
            FamilyRow(name: "munon")
            FamilyRow(name: "gomin")
            FamilyRow(name: "durup")
        }
    }
}

struct SwiftUIListTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIListTest()
    }
}
