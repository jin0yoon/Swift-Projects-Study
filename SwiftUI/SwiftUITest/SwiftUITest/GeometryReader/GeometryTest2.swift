//
//  GeometryTest2.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/12/23.
//

import SwiftUI

struct GeometryTest2: View {
    
    @State var num : CGFloat = 2.0
    
    var body: some View {
        
        VStack(spacing:0){
            
            HStack{
                VStack{
                    HStack(spacing:0){
                        MyRectangle(num: $num, color: Color.blue)
                        
                        VStack(spacing:0){
                            MyRectangle(num: $num, color: Color.red)
                            
                            HStack(spacing:0){
                                MyRectangle(num: $num, color: Color.yellow)
                                MyRectangle(num: $num, color: Color.green)
                            }
                            
                        }
                        
                    }
                    
                    HStack(spacing:0){
                        MyRectangle(num: $num, color: Color.blue)
                        
                        VStack(spacing:0){
                            MyRectangle(num: $num, color: Color.red)
                            
                            HStack(spacing:0){
                                MyRectangle(num: $num, color: Color.yellow)
                                MyRectangle(num: $num, color: Color.green)
                            }
                        }
                        
                    }
                }
                
                VStack{
                    HStack(spacing:0){
                        MyRectangle(num: $num, color: Color.blue)
                        
                        VStack(spacing:0){
                            MyRectangle(num: $num, color: Color.red)
                            
                            HStack(spacing:0){
                                MyRectangle(num: $num, color: Color.yellow)
                                MyRectangle(num: $num, color: Color.green)
                            }
                        }
                        
                    }
                    
                    HStack(spacing:0){
                        MyRectangle(num: $num, color: Color.blue)
                        
                        VStack(spacing:0){
                            MyRectangle(num: $num, color: Color.red)
                            
                            HStack(spacing:0){
                                MyRectangle(num: $num, color: Color.yellow)
                                MyRectangle(num: $num, color: Color.green)
                            }
                        }
                        
                    }
                }
            }
            
            
        }
    }
}

struct MyRectangle: View {
    
    @Binding var num : CGFloat
    
    var color : Color
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .path(in: CGRect(x: 0,
                                 y: 0,
                                 width: geometry.size.width,
                                 height: geometry.size.height))
                .fill(color)
            
            
        }
    }
}

struct GeometryTest2_Previews: PreviewProvider {
    static var previews: some View {
        GeometryTest2()
    }
}
