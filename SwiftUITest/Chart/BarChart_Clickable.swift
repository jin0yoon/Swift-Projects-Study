//
//  BarChart_Clickable.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/11/13.
//

import SwiftUI

struct BarChart_Clickable: View {
    var body: some View {
        Home2()
    }
}

struct BarChart_Clickable_Previews: PreviewProvider {
    static var previews: some View {
        BarChart_Clickable()
    }
}

struct Home2 : View {
    
    @State var selected = 0
    var colors = [Color("Color1"), Color("Color")]
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                
                HStack{
                    
                    Text("Hello Emma")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}){
                        
                        Image("menu")
                            .renderingMode(.original)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                //Bar Chart...
                
                VStack(alignment: .leading, spacing: 25) {
                    Text("Daily Workout in Hrs")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 15){
                        
                        ForEach(workout_Data){work in
                            
                            //Bars
                            VStack{
                                
                                VStack{
                                    
                                    Spacer(minLength: 0)
                                    
                                    if selected == work.id{
                                        
                                        Text(getHrs(value: work.workout_In_Min))
                                            .foregroundColor(Color("Color"))
                                            .padding(.bottom, 5)
                                    }
                                    
                                    Rectangle()
                                        .fill(LinearGradient(gradient: .init(colors: selected == work.id ? colors : [Color.white.opacity(0.06)]), startPoint: .top, endPoint: .bottom))
                                    
                                    //max height = 200
                                        .frame(height: getHeight(value: work.workout_In_Min))
                                }
                                .frame(height: 220)
                                .onTapGesture {
                                    
                                    withAnimation(.easeOut){
                                        
                                        selected = work.id
                                        
                                    }
                                }
                                
                                Text(work.day)
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding()
                .background(Color.white.opacity(0.06))
                .cornerRadius(10)
                .padding()
                
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .preferredColorScheme(.dark)
        
        //status bar color is not changing
        //its still in beta...
    }
    
    //calculating Hrs For Height
    func getHeight(value: CGFloat) -> CGFloat{
        
        //the value in minutes
        //24 hrs in min = 1440
        
        //getting height
        let hrs = CGFloat(value / 1440) * 200
        
        return hrs
    }
    
    //getting hrs
    func getHrs(value: CGFloat) -> String{
        
        let hrs = value / 60
        
        return String(format: "%.1f", hrs)
    }
}

//sample Data...
struct Daily: Identifiable {
    
    var id : Int
    var day : String
    var workout_In_Min : CGFloat
}

var workout_Data = [
    Daily(id: 0, day: "Day 1", workout_In_Min: 480),
    Daily(id: 1, day: "Day 2", workout_In_Min: 880),
    Daily(id: 2, day: "Day 3", workout_In_Min: 250),
    Daily(id: 3, day: "Day 4", workout_In_Min: 360),
    Daily(id: 4, day: "Day 5", workout_In_Min: 1220),
    Daily(id: 5, day: "Day 6", workout_In_Min: 750),
    Daily(id: 6, day: "Day 7", workout_In_Min: 950)
]
