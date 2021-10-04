//
//  Example_Text.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/02.
//

import SwiftUI

fileprivate struct Example01: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("텍스트 뷰는 이렇게 사용합니다.")
            
            Text("글자색을 파랑색으로 변경")
                .foregroundColor(.blue)
            
            Text("폰트 크기 변경")
                .font(.system(size: 30))
           
            Text("폰트, 굵기 변경")
                .font(.title)
                .fontWeight(.bold)
            
            Text("폰트 설정 변경 abcdedf 1234567")
                .bold()             // 볼드체
                .italic()           // 이탤릭체
                .underline()        // 밑줄
                .strikethrough()    // 취소선
                .monospacedDigit()  // monospaced 적용 (글자 너비가 모두 동일한 글씨체)
            
            Text("폰트 최소, 최대 크기 설정")
                .font(.title)
                .dynamicTypeSize(...DynamicTypeSize.accessibility1)   // 최대 accessibility1 크기까지
                .dynamicTypeSize(.large...)                           // 최소 large 크기까지 (최대크기는 제한 없음)
                .dynamicTypeSize(.large ... .accessibility1)          // 최소 large ~ 최대 accessibility1 까지
        }
    }
}

fileprivate struct Example02: View {
    var body: some View {
        VStack {
            Text("**Markdown**")
            Text("~~사용 가능합니다.~~")
            // 링크를 누르면 Safari로 열립니다.
            Text("링크 첨부도 가능합니다. [Meetup](https://meetup.toast.com/)")
        }
    }
}

fileprivate struct Example03: View {
    var body: some View {
        VStack {
            Text("여백을 주고 배경색 변경")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
            
            Text("배경색 변경 후 여백 주기")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .background(Color.green)
                .padding()
            
//            Text("배경색 변경 후 폰트 굵기 변경")       // return Text
//                .background(Color.black)        // return View
//                .fontWeight(.bold)              // fontWeight는 Text의 method이기 때문에 에러남
        }
    }
}

fileprivate struct Example04: View {
    var body: some View {
        List {
            HStack {
                Text("body")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .frame(height: 30)
                    .cornerRadius(15)
                Spacer()
                Text("가나다ABC123")
                    .font(.system(.body))
            }
            HStack {
                Text("subheadline")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .frame(height: 30)
                    .cornerRadius(15)
                Spacer()
                Text("가나다ABC123")
                    .font(.system(.subheadline))
            }
            HStack {
                Text("headline")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .frame(height: 30)
                    .cornerRadius(15)
                Spacer()
                Text("가나다ABC123")
                    .font(.system(.headline))
            }
            HStack {
                Text("footnote")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .frame(height: 30)
                    .cornerRadius(15)
                Spacer()
                Text("가나다ABC123")
                    .font(.system(.footnote))
            }
            HStack {
                Text("largeTitle")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .frame(height: 30)
                    .cornerRadius(15)
                Spacer()
                Text("가나다ABC123")
                    .font(.system(.largeTitle))
            }
            HStack {
                Text("title")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .frame(height: 30)
                    .cornerRadius(15)
                Spacer()
                Text("가나다ABC123")
                    .font(.system(.title))
            }
        }
    }
}

struct Example_Text_Previews: PreviewProvider {
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
        }
    }
}
