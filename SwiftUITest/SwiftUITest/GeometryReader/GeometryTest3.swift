//
//  GeometryTest3.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/12/23.
//

import SwiftUI

struct GeometryTest3: View {
    
    @State var width1 : CGFloat = 0.43
    @State var height1 : CGFloat = 0.27
    
    var body: some View {
        
        VStack{
            GeometryReader{ metrics in
                HStack {
                    
                    VStack {
                        GeometryReader{ metrics in
                            VStack{
                                VStack{
                                    GeometryReader { metrics in
                                        HStack{
                                            Color.red.frame(width: metrics.size.width * width1)
                                            
                                            VStack(spacing: 0) {
                                                
                                                Color.green.frame(height: metrics.size.height * height1)
                                                Color.yellow
                                            }
                                        }
                                        
                                    }
                                }
                                .frame(height: metrics.size.height * height1)
                                
                                VStack{
                                    Color.blue
                                }
                            }
                            
                        }
                        
                    }.frame(width: metrics.size.width * width1)
                    
                    
                    VStack{
                        GeometryReader { metrics in
                            HStack{
                                Color.red.frame(width: metrics.size.width * width1)
                                
                                VStack(spacing: 0) {
                                    
                                    Color.green.frame(height: metrics.size.height * height1)
                                    Color.yellow
                                }
                            }
                            
                        }
                    }
                    
                }
                
            }
            
            
            HStack{
                Button(action: {
                    width1 += 0.1
                    height1 += 0.1
                }) {
                    Text("+")
                        .font(.largeTitle)
                        .frame(width: 50)
                        .foregroundColor(.white)
                        .background(Color.black)
                        
                }
                
                Button(action: {
                    width1 -= 0.1
                    height1 -= 0.1
                }) {
                    Text("-")
                        .font(.largeTitle)
                        .frame(width: 50)
                        .foregroundColor(.white)
                        .background(Color.black)
                }
            }
            
            

        }
        
        
        
    }
}

struct GeometryTest3_Previews: PreviewProvider {
    static var previews: some View {
        GeometryTest3()
    }
}
