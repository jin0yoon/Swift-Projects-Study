//
//  GeometryTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/12/23.
//

import SwiftUI

struct GeometryTest: View {
    
    @State var maximumSubViewWidth: CGFloat = 0

        var body: some View
        {
            HStack
            {
                Button(action: {})
                {
                    Text("Item 1")
                        .padding()
                        .frame(minWidth: maximumSubViewWidth)
                }
                .background(Color.secondary.opacity(0.25))
                .overlay(DetermineWidth())

                Button(action: {})
                {
                    Text("Item 2 is long")
                        .padding()
                        .frame(minWidth: maximumSubViewWidth)
                }
                .background(Color.secondary.opacity(0.25))
                .overlay(DetermineWidth())
            }
            .onPreferenceChange(DetermineWidth.Key.self)
            {
                maximumSubViewWidth = $0
            }
        }
    }

struct DetermineWidth: View
{
    typealias Key = MaximumWidthPreferenceKey
    var body: some View
    {
        GeometryReader
        {
            proxy in
            Color.clear
                .anchorPreference(key: Key.self, value: .bounds)
                {
                    anchor in proxy[anchor].size.width
                }
        }
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

struct GeometryTest_Previews: PreviewProvider {
    static var previews: some View {
        GeometryTest()
    }
}
