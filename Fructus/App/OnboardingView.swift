//
//  OnboardingView.swift
//  Fructus
//
//  Created by 윤진영 on 2020/11/18.
//

import SwiftUI

struct OnboardingView: View {
    
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    
    var body: some View {
        TabView{
            ForEach(0..<5){ item in
                FruitCardView()
            }//: LOOP
            
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
        
    }
}

//MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
