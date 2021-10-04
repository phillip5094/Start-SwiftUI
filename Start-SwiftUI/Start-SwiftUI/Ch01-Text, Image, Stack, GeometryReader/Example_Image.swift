//
//  Example_Image.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/02.
//

import SwiftUI

fileprivate struct Example01: View {
    var body: some View {
        HStack(spacing: 80) {
            Image("street")
                .border(Color.yellow, width: 4)     // 현재 영역의 테두리 색깔을 노랑색으로 설정
            Image("street")
                .frame(width: 200, height: 200)     // 200x200 크기로 설정
                .border(Color.yellow, width: 4)     // 현재 영역의 테두리 색깔을 노랑색으로 설정
        }
    }
}

fileprivate struct Example02: View {
    var body: some View {
        HStack(spacing: 80) {
            Image("street")
                .border(Color.yellow, width: 4)
            Image("street")
                .resizable()
                .frame(width: 200, height: 200)
                .border(Color.yellow, width: 4)
        }
    }
}

fileprivate struct Example03: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Image("home")
                    .resizable()
                    .frame(width: 180, height:180)
                    .border(Color.yellow, width: 4)
                Text("기본값")
                    .offset(y: 50)
            }
            VStack {
                Image("home")
                    .resizable()
                // 이미지가 프레임을 벗어나지 않는 선에서 비율을 유지한채로 최대로 확대합니다.
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .border(Color.yellow, width: 4)
                Text("scaledToFit")
                    .offset(y: 50)
                
            }
            VStack {
                Image("home")
                    .resizable()
                // 이미지가 프레임을 벗어나는걸 감수하고 비율을 유지한채로 최대로 확대합니다.
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .border(Color.yellow, width: 4)
                Text("scaledToFill")
                    .offset(y: 50)
            }
        }
        
    }
}

fileprivate struct Example04: View {
    var body: some View {
        HStack {
            Image("street")
                .frame(width: 180, height: 180)
                .clipShape(Circle())            // 원 모양으로 자르기
                .border(Color.yellow, width: 2)
            Image("street")
                .frame(width: 180, height: 180)
                .clipShape(
                    Rectangle().inset(by: 10)   // 사방으로 10씩 크기를 줄인 사각형으로 자르기
                )
                .border(Color.yellow, width: 2)
        }
    }
}

fileprivate struct Example05: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                Image(systemName: "person.crop.circle.fill.badge.plus")
                Image(systemName: "person.circle")
                    .foregroundColor(.blue)
                Image(systemName: "drop.triangle.fill")
                    .renderingMode(.original)      // 특정 심볼은 multi-color를 지원합니다.
                    .font(.system(size: 40))
                Image(systemName: "cloud.sun.bolt.fill")
                    .renderingMode(.original)      // 특정 심볼은 multi-color를 지원합니다.
                    .font(.system(size: 40))
                    .padding()
                    .background(Color.black)
            }
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "heart.fill")
                    .imageScale(.small)
                Image(systemName: "heart.fill")
                    .imageScale(.medium)
                Image(systemName: "heart.fill")
                    .imageScale(.large)
                Image(systemName: "heart.fill")
                    .font(.system(size: 40))
            }
            HStack {
                // 크기 조절
                Image(systemName: "phone.circle")
                    .font(.system(size: 20))
                Image(systemName: "phone.circle")
                    .font(.system(size: 40))
                Image(systemName: "phone.circle")
                    .font(.system(size: 60))
            }
            HStack {
                // 굵기 조절
                Image(systemName: "mic")
                    .font(Font.title.weight(.bold))
                Image(systemName: "mic")
                    .font(Font.title.weight(.light))
                Image(systemName: "mic")
                    .font(Font.title.weight(.ultraLight))
            }
        }
        
    }
}

fileprivate struct Example06: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://picsum.photos/200/200")!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()          // 이미지를 로딩하기 전까지 출력할 뷰
                    .scaleEffect(3)
            }
            .frame(width: 200, height: 200)
            
            AsyncImage(url: URL(string: "https://picsum.photos/200/200")!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
                    .scaleEffect(3)
            }
            .frame(width: 200, height: 200)
        }
    }
}

struct Example_Image_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Example01()
                .previewLayout(.fixed(width: 900, height: 500))
                .previewDisplayName("Example01")
            Example02()
                .previewLayout(.fixed(width: 900, height: 500))
                .previewDisplayName("Example02")
            Example03()
                .previewInterfaceOrientation(.landscapeLeft)
                .previewDisplayName("Example03")
            Example04()
                .previewDisplayName("Example04")
            Example05()
                .previewDisplayName("Example05")
            Example06()
                .previewDisplayName("Example06")
        }
        
    }
}
