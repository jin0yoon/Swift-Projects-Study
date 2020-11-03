//
//  SwiftUIListSectionGroupTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

//리스트에 섹션 추가
//struct TaskRow: View {
//    var body: some View{
//        Text("Task item")
//    }
//}

//리스트 그룹화
struct GroupedRow: View {
    var body: some View{
        Text("Grouped Row")
    }
}

struct SwiftUIListSectionGroupTest: View {
    var body: some View {
        //리스트에 섹션 추가
        //리스트에 섹션을 추가하기 위해서는 리스트안에 Section(header:){}을 넣어주고
        //그 안에 리스트 아이템을 넣어줌
//        List{
//            Section(header: Text("Important")){
//                TaskRow()
//                TaskRow()
//                TaskRow()
//            }
//            Section(header: Text("Other")){
//                TaskRow()
//                TaskRow()
//                TaskRow()
//            }
//        }
        
        //리스트 그룹화
        //리스트를 그룹화하려면, 리스트에 섹션을 추가할 때와 같이 코드를 작성하고
        //List 뒤에 .listStyle(GroupedListStyle())를 달아줌
        List{
            Section(header: Text("Grouped")){
                GroupedRow()
                GroupedRow()
                GroupedRow()
            }
        }.listStyle(GroupedListStyle())
    }
    
}

struct SwiftUIListSectionGroupTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIListSectionGroupTest()
    }
}
