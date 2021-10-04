//
//  Example_GeometryReader.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/04.
//

import SwiftUI

fileprivate struct Example01: View {
    var body: some View {
        VStack {
            GeometryReader { _ in
                Text("GeometryReader View")
            }
            .border(Color.yellow, width: 2)
            
            VStack {
                GeometryReader { _ in
                    Text("GeometryReader View")
                }
                .border(Color.yellow, width: 2)
            }
            .frame(width: 300, height: 300)
        }
    }
}

fileprivate struct Example02: View {
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { geometryProxy in
                VStack(alignment: .leading) {
                    Text("SafeArea.top : \(geometryProxy.safeAreaInsets.top)")
                    // 현재 GeometryReader의 bottom safeArea는 없기 때문에 0 입니다.
                    Text("SafeArea.bottom : \(geometryProxy.safeAreaInsets.bottom)")
                }
                .padding()
            }
            .border(Color.red, width: 5)
            
            Color.yellow
            
            GeometryReader { geometryProxy in
                VStack(alignment: .leading) {
                    // 현재 GeometryReader의 top safeArea는 없기 때문에 0 입니다.
                    Text("SafeArea.top : \(geometryProxy.safeAreaInsets.top)")
                    
                    Text("SafeArea.bottom : \(geometryProxy.safeAreaInsets.bottom)")
                }
                .padding()
            }
            .border(Color.blue, width: 5)
        }
    }
}

fileprivate struct Example03: View {
    var body: some View {
        GeometryReader { geometryProxy in
            VStack(alignment: .leading) {
                Text("Width : \(geometryProxy.size.width)")
                Text("Height : \(geometryProxy.size.height)")
                
            }
            .padding()
        }
        .frame(width: 300, height: 200)
        .border(Color.yellow, width: 5)
    }
}

fileprivate struct Example04: View {
    var body: some View {
        VStack(spacing: 0) {
            Color.red
                .frame(height: 150)
                .overlay(
                    Text("높이 150")
                        .foregroundColor(.white)
                )
            HStack(spacing: 0) {
                Color.blue
                    .frame(width: 100)
                    .overlay(
                        Text("너비 100")
                            .foregroundColor(.white)
                    )
                GeometryReader { geometryProxy in
                    VStack(alignment: .leading) {
                        Text("Global 상대 좌표")
                        // x = blue 너비
                        // y = top safeArea + red 높이
                        Text("offset => (\(geometryProxy.frame(in: .global).origin.x), \(geometryProxy.frame(in: .global).origin.y))")
                        
                        Text("Local 상대 좌표")
                        // x = 0
                        // y = 0
                        Text("offest => (\(geometryProxy.frame(in: .local).origin.x), \(geometryProxy.frame(in: .local).origin.y))")
                        
                        Text("HStack과의 상대 좌표")
                        // x = blue 너비
                        // y = 0
                        Text("offset => (\(geometryProxy.frame(in: .named("HStack")).origin.x), \(geometryProxy.frame(in: .named("HStack")).origin.y))")
                    
                    }
                    .padding()

                }
            }
            // HStack에 명시적으로 이름을 설정해줌.
            .coordinateSpace(name: "HStack")
        }
        .border(Color.yellow, width: 5)
    }
}

fileprivate struct Example05: View {
    var body: some View {
        GeometryReader { geometryProxy in
            Text("중앙에 배치하는 방법")
                .padding()
                .position(x: geometryProxy.frame(in: .local).midX,
                          y: geometryProxy.frame(in: .local).midY)
            
        }
        .frame(width: 200, height: 300)
        .border(Color.yellow, width: 3)
    }
}

struct Example_GeometryReader_Previews: PreviewProvider {
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
