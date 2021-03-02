//
//  CardFlipAnimation.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2021/01/10.
//

import SwiftUI

struct CardFlipAnimation: View {
    
    @State private var flipped : Bool = false
    @State private var flip : Bool = false
    
    var body: some View {
        ZStack {
            Card(title: "Learn Swift UI", description: "In this video we gone build a flip card")
                .opacity(flipped ? 0 : 1)
            Card(title: "Learn Swift UI", icon: "images (1)")
                .opacity(flipped ? 1 : 0)
        }
        .modifier(FlipEffect(flipped: $flipped, angle: flip ? 0 : 180))
        .onTapGesture (count: 1 , perform: {
            withAnimation{
                flip.toggle()
            }
        })
    }
}

struct CardFlipAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CardFlipAnimation()
    }
}

struct Card : View {
    
    var title: String
    var description : String = ""
    var icon: String = ""
    
    var body: some View{
        
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 350, height: 250)
            .shadow(color : Color.gray, radius: 10, x: 5, y: 5)
            .overlay(
                VStack (alignment: icon != "" ? .center : .leading, spacing: 10){
                    
                    if icon != ""{
                        Image(icon)
                    }
                    
                    Text(title)
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    if description != "" {
                        Text(description)
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    
                }
            
            )
    }
}


struct FlipEffect : GeometryEffect{
    
    var animatableData: Double{
        get{angle}
        set{angle = newValue}
    }
    
    @Binding var flipped : Bool
    var angle : Double
    
    func effectValue(size: CGSize) -> ProjectionTransform{
        
        DispatchQueue.main.async {
            flipped = angle >= 90 && angle < 270
        }
        
        print(angle)
        let newAngle = flipped ? -180 + angle : angle
        
        let angleInRadians = CGFloat(Angle(degrees: newAngle).radians)
        
        var transform3d = CATransform3DIdentity
        transform3d.m34 = -1/max(size.width, size.height)
        
        transform3d = CATransform3DRotate(transform3d, angleInRadians, 0, 1, 0)
        transform3d = CATransform3DTranslate(transform3d, -size.width / 2, -size.height / 2, 0)
        
        let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2, y: size.height/2))
        
        return ProjectionTransform(transform3d).concatenating(affineTransform)
    }
    
}
