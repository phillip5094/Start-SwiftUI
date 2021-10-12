//
//  Example_ViewModifier.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/11.
//

import SwiftUI

fileprivate struct Example01: View {
    var body: some View {
        HStack {
            // 동일한 설정의 코드가 중복되어서 관리도 어렵고 가독성도 안좋아졌습니다.
            Text("MyModifier")
                .foregroundColor(.red)
                .rotationEffect(Angle(degrees: 60))
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(.blue, lineWidth: 3))
            Image(systemName: "person")
                .resizable()
                .foregroundColor(.yellow)
                .rotationEffect(Angle(degrees: 60))
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(.black, lineWidth: 3))
        }
    }
}

fileprivate struct MyViewModifier: ViewModifier {
    // 확장성을 고려하여 인자로 받습니다.
    var color: Color = .red
    var strokeColor: Color = .blue
    
    // custom Modifier를 적용했을 때 출력할 결과물을 반환해줍니다.
    func body(content: Content) -> some View {
        // content를 꾸며줍시다.
        content
            .foregroundColor(color)
            .rotationEffect(Angle(degrees: 60))
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(strokeColor, lineWidth: 3))
    }
}

fileprivate extension View {
    func mySetting(color: Color = .red, strokeColor: Color = .blue) -> some View {
        modifier(MyViewModifier(color: color, strokeColor: strokeColor))
    }
}

fileprivate struct Example02: View {
    var body: some View {
        HStack {
            Text("MyModifier")
                // .modifier(MyViewModifier())
                .mySetting()
            Image(systemName: "person")
                .resizable()
                // .modifier(MyViewModifier(color: .yellow, strokeColor: .black))
                .mySetting(color: .yellow, strokeColor: .black)
        }
    }
}

struct Example_ViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Example01()
                .previewDisplayName("Example01")
            Example02()
                .previewDisplayName("Example02")
        }
    }
}
