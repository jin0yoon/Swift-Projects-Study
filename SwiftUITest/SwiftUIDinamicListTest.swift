//
//  SwiftUIDinamicListTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

//다이나믹 리스트
//Family라는 Identifiable 프로토콜을 상속 받는 struct
//Identifiable을 상속받기 위해서는 고유 id 값만 있으면 됨
//Family struct에 id와 name 변수를 선언
struct Family: Identifiable {
    var id = UUID()
    var name: String
}

//다이나믹 리스트를 구헝하는 것인만큼 정적인 name 변수 대신
//family라는 Family 타입 변수를 선언한다.
struct FamilyRow2: View {
    var family: Family
    var body: some View{
        Text("Family: \(family.name)")
    }
}

struct SwiftUIDinamicListTest: View {
    var body: some View {
//        다이나믹 리스트
//        리스트에 들어갈 first, second, third 아이템을 만들고
//        familes 배열에 넣어준 뒤,
//        return 값으로 리스트를 반환함
//        families 배열안에 있는 family element를
//        각각 반복 실행해서 리스트에 보여줌
        let first = Family(name: "munon")
        let second = Family(name: "gumin")
        let third = Family(name: "durup")
        let families = [first, second, third]
        return List(families) { family in FamilyRow2(family: family)
        }
    }
}

struct SwiftUIDinamicListTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDinamicListTest()
    }
}
