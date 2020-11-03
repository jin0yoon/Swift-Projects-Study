//
//  SwiftUINavigarionDetailView.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/06.
//

import SwiftUI

struct SwiftUINavigarionDetailView: View {
    var body: some View {
        //navigation link를 통해 이동할 detail view
        VStack(){
            Text("안녕")
        }.navigationTitle("우이")
    }
}

struct SwiftUINavigarionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUINavigarionDetailView()
    }
}
