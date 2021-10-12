//
//  Example_Animation.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/11.
//

import SwiftUI

fileprivate struct Example01: View {
    @State private var scale: CGFloat = 1
    @State private var degree: Double = 0
    
    var body: some View {
        VStack {
            Image("street").resizable()
                .frame(width: 100, height: 100)
                // Button 뷰에만 애니메이션 설정을 했기 때문에 애니메이션 처리가 되지 않습니다.
                .scaleEffect(scale)
            
            Button("Implicit Animation") {
                scale += 0.3
                degree += 30
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .scaleEffect(scale)
            // degree 변수는 애니메이션 설정을 하지 않았지만 애니메이션 처리가 됩니다.
            .rotationEffect(Angle(degrees: degree))
            // scale 변수에 대해서 애니메이션 설정 (암시적)
            .animation(.easeInOut, value: scale)
            .padding()
        }
    }
}

fileprivate struct Example02: View {
    @State private var scale: CGFloat = 1
    @State private var degree: Double = 0
    
    var body: some View {
        VStack {
            Image("street").resizable()
                .frame(width: 100, height: 100)
                .scaleEffect(scale)
            
            Button("Implicit Animation") {
                scale += 0.3
                degree += 30
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .scaleEffect(scale)
            .animation(.easeInOut, value: scale)
            // animation 설정 이후에 회전 효과를 넣었기 때문에 애니메이션이 적용되지 않습니다.
            .rotationEffect(Angle(degrees: degree))
            .padding()
        }
    }
}

fileprivate struct Example03: View {
    @State private var scale: CGFloat = 1
    @State private var degree: Double = 0
    
    var body: some View {
        VStack {
            Image("street").resizable()
                .frame(width: 100, height: 100)
                // animation 효과가 적용됩니다.
                .scaleEffect(scale)
            
            Button("Explicit Animation") {
                withAnimation {
                    // scale 값이 변할 때, 이 변수를 사용하는 모든 뷰에 애니메이션이 적용됩니다. (명시적)
                    scale += 0.3
                }
                // degree에는 애니메이션을 설정하지 않았습니다.
                degree += 30
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .scaleEffect(scale)
            // 회전 애니메이션이 동작하지 않습니다.
            .rotationEffect(Angle(degrees: degree))
            .padding()
        }
    }
}

fileprivate struct Example04: View {
    @State private var scale: CGFloat = 1
    @State private var degree: Double = 0
    
    var body: some View {
        VStack {
            Image("street").resizable()
                .frame(width: 100, height: 100)
                .scaleEffect(scale)
                .transaction { view in
                    // spring 애니메이션으로 대체됩니다.
                    view.animation = .spring(response: 0.3, dampingFraction: 0.1)
                }
            
            Button("애니메이션을 override하고 싶을 땐\nTransaction") {
                withAnimation {
                    scale += 0.3
                    degree += 30
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .scaleEffect(scale)
            .rotationEffect(Angle(degrees: degree))
            .padding()
        }
    }
}

fileprivate struct Example05: View {
    @State private var addView: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    addView.toggle()
                }
            }) {
                Text(addView ? "Remove" : "Add")
            }
            .padding()
            .background(Capsule().stroke())
            .foregroundColor(.blue)
            
            Spacer()
            
            if addView {
                Text("opacity").padding()
                    .transition(.opacity)
                Text("scale").padding()
                    .transition(.scale)
                Text("slide").padding()
                    .transition(.slide)
                Text("offset").padding()
                    .transition(.offset(x: 100, y: 100))
                Text("move").padding()
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(width: 300, height: 400)
    }
}

struct Example_Animation_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Example01()
                .previewDisplayName("Example01")
            Example02()
                .previewDisplayName("Example02")
            Example03()
                .previewDisplayName("Example03")
            Example04()
                .previewDisplayName("Example04")
            Example05()
                .previewDisplayName("Example05")
        }
    }
}
