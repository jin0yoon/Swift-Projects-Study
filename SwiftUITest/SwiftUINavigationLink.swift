//
//  SwiftUINavigationLink.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/02.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        Text("Detail")
    }
}

//내비게이션 링크
//내비게이션 뷰가 있고,SwiftUI의 내비게이션 뷰를 pust하고 싶다면
//내비게이션 링크를 사용
struct SwiftUINavigationLink: View {
    var body: some View {
        NavigationView {
            Text("Hi")
                .navigationTitle(Text("Intro"))
                .navigationBarItems(trailing:
                    NavigationLink(destination: DetailView()){
                        Image(systemName:
                                "arrowtriangle.right.circle.fill").resizable().frame(width: 25, height: 25, alignment: .trailing)
                    }
                )
        }
    }
}

struct SwiftUINavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUINavigationLink()
    }
}
