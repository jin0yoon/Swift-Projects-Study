//
//  BarChart.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/21.
//

import SwiftUI

struct BarChart: View {
    var body: some View {
        
        HStack(alignment: .bottom){
            ForEach(percents){ i in
                
                Bar(percent: i.percent, day: i.day)
            }
        }.frame(height: 250)
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}

struct Bar: View {
    
    var percent : CGFloat = 0
    var day = ""
    
    var body: some View{
        
        VStack{
            
            Text(String(format: "%.0f", Double(percent)) + "%").foregroundColor(Color.black.opacity(0.5))
            
            Rectangle().fill(Color.red).frame(width: UIScreen.main.bounds.width / 7 - 12, height: getHeight())
            
            Text(day).foregroundColor(Color.black.opacity(0.5))
        }
        
        
        
    }
    
    func getHeight() -> CGFloat {
        
        return 200 / 100 * percent
    }
}

//Sample Datas

struct type: Identifiable {
    
    var id: Int
    var percent: CGFloat
    var day: String
}

var percents = [
    type(id: 0, percent: 35, day: "Mon"),
    type(id: 1, percent: 45, day: "Tue"),
    type(id: 2, percent: 55, day: "Wed"),
    type(id: 3, percent: 65, day: "Thu"),
    type(id: 4, percent: 75, day: "Fri"),
    type(id: 5, percent: 85, day: "Sat"),
    type(id: 6, percent: 95, day: "Sun")
]
