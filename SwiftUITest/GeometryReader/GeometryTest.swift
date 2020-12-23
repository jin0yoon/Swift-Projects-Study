//
//  GeometryTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/12/23.
//

import SwiftUI

struct GeometryTest: View {
    
    typealias Key = MaximumWidthPreferenceKey
    
    var body: some View {
        GeometryReader
        {
            proxy in
            
            // view rendering code goes here; can access proxy.size
            Color.clear
                .anchorPreference(key: Key.self, value: .bounds)
                {
                    anchor in proxy[anchor].size.width
                }
        }
    }
}

struct GeometryTest_Previews: PreviewProvider {
    static var previews: some View {
        GeometryTest()
    }
}

struct MaximumWidthPreferenceKey: PreferenceKey
{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat)
    {
        value = max(value, nextValue())
    }
}
