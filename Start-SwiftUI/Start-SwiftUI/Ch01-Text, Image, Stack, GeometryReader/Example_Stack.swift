//
//  Example_Stack.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/02.
//

import SwiftUI

fileprivate struct Example01: View {
    var body: some View {
        VStack {
            // HStack : 뷰를 수평으로 나열함
            HStack {
                Color.blue
                    .frame(width: 100, height: 100)
                Color.yellow
                    .frame(width: 100, height: 100)
            }
            Text("HStack")
            
            // VStack : 뷰를 수직으로 나열함
            VStack {
                Color.blue
                    .frame(width: 100, height: 100)
                Color.yellow
                    .frame(width: 100, height: 100)
            }
            Text("VStack")
            
            // ZStack : 뷰를 겹겹이 쌓음
            ZStack {
                Color.blue
                    .frame(width: 150, height: 150)
                Color.yellow
                    .frame(width: 120, height: 120)
                Color.red
                    .frame(width: 90, height: 90)
            }
            Text("ZStack")
        }
    }
}

fileprivate struct Example02: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("색깔을 잘보세요")                 // Stack 뷰 설정인 blue로 설정됨
            Image(systemName: "person")         // Stack 뷰 설정인 blue로 설정됨
                .font(Font.system(size: 40))
            Circle()                            // blue가 아닌 yellow로 설정됨
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
        }
        .foregroundColor(.blue)
    }
}

fileprivate struct Example03: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                Spacer()
            }
            Spacer()
        }
        .frame(width: 300, height: 300)
    }
}

fileprivate struct Example04: View {
    var body: some View {
        VStack {
            Spacer()        // Spacer끼리 동일한 길이로 설정됨
            Text("Text1")
                .padding()
                .overlay(
                    Rectangle()
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 2, dash: [10]))
                )
            Spacer()        // Spacer끼리 동일한 길이로 설정됨
            Text("Text1")
                .padding()
                .overlay(
                    Rectangle()
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 2, dash: [10]))
                )
            Spacer()        // Spacer끼리 동일한 길이로 설정됨
        }
        .overlay(
            Rectangle()
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 1, dash: [10]))
        )
    }
}

fileprivate struct Example05: View {
    var body: some View {
        VStack {
            HStack {
                Text("Spacer minLength를 설정하지 않았을 경우")
                    .foregroundColor(.white)
                    .background(Color.blue)
                Spacer()
            }
            .frame(width: 200, height: 200)
            .background(Color.yellow)
            HStack {
                Text("Spacer minLength를 설정한 경우")
                    .foregroundColor(.white)
                    .background(Color.blue)
                Spacer(minLength: 100)
            }
            .frame(width: 200, height: 200)
            .background(Color.yellow)
        }
    }
}

struct Example_Stack_Previews: PreviewProvider {
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
