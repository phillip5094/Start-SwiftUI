//
//  Example_Preview.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/09.
//

import SwiftUI

fileprivate struct Example01: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Example_Preview_Previews: PreviewProvider {      // PreviewProvider 프로토콜 준수
    static var previews: some View {
        // 미리보기를 하고 싶은 뷰를 추가해줍니다.
        Group {
            Example01()
            // 화면에 출력되는 Preview 제목을 바꿀 수 있습니다.
            Example01()
                .previewDisplayName("Hello World")
            // 다른 모델로 Preview 할 수 있습니다.
            Example01()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            
            // PreviewLayout 설정
            Example01()
                .previewDisplayName("device")
                .previewLayout(.device)

            Example01()
                .previewDisplayName("sizeThatFits")
                .previewLayout(.sizeThatFits)

            Example01()
                .previewDisplayName("fixed")
                .previewLayout(.fixed(width: 200, height: 100))
            
            // 다비이스 회전
            Example01()
                .previewInterfaceOrientation(.landscapeLeft)
            // 다크모드
            Example01()
                .previewLayout(.fixed(width: 200, height: 100))
                .preferredColorScheme(.dark)
            
        }
    }
}
