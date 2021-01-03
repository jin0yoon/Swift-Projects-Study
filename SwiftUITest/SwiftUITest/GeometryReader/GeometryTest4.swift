//
//  GeometryTest4.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/12/31.
//

import SwiftUI

struct GeometryTest4: View {
    var body: some View {
        
        VStack{
            
            Text("ddd")
                .frame(height: 300)
            
            GeometryReader { metrics in
                Text("\(metrics.size.height)")
                    .position(x: metrics.size.width/5,
                              y: metrics.size.height/10)

                HStack{
                    Text("\(metrics.size.height)")
                    Color.red.frame(width: metrics.size.width * 0.5)
                    
                    VStack(spacing: 0) {
                        Text("\(metrics.size.height)")
                        Color.green.frame(height: metrics.size.height * 0.5)
                        
                    }
                }
                
            }
        }
        
        
        GeometryReader { metrics in
            Text("\(metrics.size.height)")
                .position(x: metrics.size.width/5,
                          y: metrics.size.height/10)
        }
        
        
    }
}

struct GeometryTest4_Previews: PreviewProvider {
    static var previews: some View {
        GeometryTest4()
    }
}
