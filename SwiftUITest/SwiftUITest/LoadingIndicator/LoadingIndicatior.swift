//
//  LoadingIndicatior.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2021/01/15.
//

import SwiftUI

struct LoadingIndicatior: View {
    
    @State var show = false
    
    var body: some View {
        
        ZStack{
            
            Button(action: {
                self.show.toggle()
            }, label: {
              Text("Custom Indicator")
            })
            
            if self.show{
                GeometryReader{_ in
                    Loader()
                }
                .background(Color.black.opacity(0.45).edgesIgnoringSafeArea(.all))
            }
            
            
        }
        
        
    }
}

struct LoadingIndicatior_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicatior()
    }
}

struct Loader : View {
    
    @State var animate = false
    
    var body: some View{
        
        VStack{
            
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: .init(colors: [.red, .orange]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
            
            Text("새로운 map을 준비중입니다.").padding(.top)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(15)
        .onAppear(){
            self.animate.toggle()
        }
        
    }
}
