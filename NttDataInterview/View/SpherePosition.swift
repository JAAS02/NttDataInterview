//
//  SpherePosition.swift
//  NttDataInterview
//
//  Created by Juan Antonio Ayala Sánchez on 13/02/25.
//
import SwiftUI

enum SpherePosition {
    case right, center, left, none
}
enum SphereSize:Float {
    case sides=389, center=294, none=0
}

struct BackgroundSpheresView: View {
    var positionBlue : SpherePosition
    var positionOrange: SpherePosition
    var positionPurple: SpherePosition
    let width = UIScreen.main.bounds.width

    ///Segun las posiciones indicadas en la inicializacion seran los puntos que se obtengan para dibujar las esferas
    func getSpherePosition(position:SpherePosition)-> CGPoint{
        switch(position){
            case SpherePosition.right:
                return CGPoint(x: width+30, y: -215)
            case SpherePosition.center:
                return CGPoint(x: width/2, y: -210)
            case SpherePosition.left:
                return CGPoint(x: -30, y: -215)
            case .none:
                return CGPoint(x: width/2, y: -272)
        }
    }
    
    func getSphereSize(position:SpherePosition)-> CGFloat{
        switch(position){
        case SpherePosition.right:
            return 389
        case SpherePosition.center:
            return 294
        case SpherePosition.left:
            return 389
        case .none:
            return 0
        }
    }
    
    var body: some View {
        ZStack{
            BlueSphereView(size: getSphereSize(position: positionBlue)).position(getSpherePosition(position: positionBlue))
            OrangeSphereView(size: getSphereSize(position: positionOrange)).position(getSpherePosition(position: positionOrange))
            PurpleSphereView(size: getSphereSize(position: positionPurple)).position(getSpherePosition(position: positionPurple))
        }
    }
}



struct BlueSphereView: View {
    var size: CGFloat
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [.blue]), startPoint: .bottom, endPoint: .top)
          .mask(
            Circle()
              .frame(width: size, height: size)
              .blur(radius: 40)
            )
    }
}
struct OrangeSphereView: View {
    var size: CGFloat
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [.orange]), startPoint: .bottom, endPoint: .top)
          .mask(
            Circle()
              .frame(width: size, height: size)
              .blur(radius: 35)
            )
    }
}
struct PurpleSphereView: View {
    var size: CGFloat
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [.purple]), startPoint: .bottom, endPoint: .top)
          .mask(
            Circle()
              .frame(width: size, height: size)
              .blur(radius: 40)
      )
    }
}
    

#Preview {
    VStack {
        BackgroundSpheresView(positionBlue: SpherePosition.left, positionOrange: SpherePosition.right, positionPurple: SpherePosition.center)
    }.background(Color(.background))
}
