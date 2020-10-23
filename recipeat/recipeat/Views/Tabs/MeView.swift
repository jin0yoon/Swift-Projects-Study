//
//  MeView.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/11.
//

import SwiftUI

struct MeView: View {
    var body: some View {
        ZStack {
            Text("This is me")
        }.navigationBarTitle("").navigationBarHidden(true)
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
