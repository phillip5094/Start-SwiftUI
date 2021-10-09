//
//  Example_Navigation.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/08.
//

import SwiftUI

fileprivate struct Example01: View {
    var body: some View {
        NavigationView {
            Text("내비게이션 뷰")
                .navigationTitle("Navigation Title")
        }
        
        //        NavigationView {
        //            Text("내비게이션 뷰")
        //        }
        //        // NavigationView 자체가 아닌 위 코드처럼 출력할 뷰에 title을 설정해줍니다.
        //        .navigationTitle("Navigation Title")
    }
}

fileprivate struct Example02: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<100) {
                    Text("자식 뷰 \($0)")
                }
            }
            .navigationTitle("Navigation Title")
            .navigationBarTitleDisplayMode(.large)      // large 스타일
            .navigationBarTitleDisplayMode(.inline)     // inline 스타일
        }
    }
}

fileprivate struct Example03: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                // 이동할 화면입니다. (destination)
                Text("This is 2nd page.")
            } label: {
                // 터치하면 다음 화면으로 넘어갑니다.
                Label("Go to 2nd page", systemImage: "arrowshape.turn.up.right.fill")
            }
            .navigationTitle("Navigation Title")
        }
    }
}

fileprivate struct Example04: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                NavigationLink {
                    Text("This is 3rd page.")
                        .navigationTitle("Third Page")
                } label: {
                    Label("This is 2nd page.\nGo to 3rd page", systemImage: "arrowshape.turn.up.right.fill")
                }
                .navigationTitle("Second Page")
                
            } label: {
                Label("Go to 2nd page", systemImage: "arrowshape.turn.up.right.fill")
            }
            .navigationTitle("First Page")
        }
    }
}

fileprivate struct Example05: View {
    var body: some View {
        NavigationView {
            Text("내비게이션 바 아이템 추가도 쉽습니다.")
                .navigationTitle("Navigation Title")
                .toolbar {
                    HStack {
                        Image("street")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Button(action: {}) {
                            Image(systemName: "pencil.tip.crop.circle")
                        }
                        Text("텍스트")
                    }
                }
        }
    }
}

fileprivate struct Example06: View {
    var body: some View {
        NavigationView {
            Text("ToobarItemGroup을 사용하면\n왼쪽에도 아이템을 추가할 수 있습니다.")
                .navigationTitle("Navigation Title")
                .toolbar {
                    // 내비게이션바 왼쪽에 아이템 배치
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Image(systemName: "folder.fill.badge.plus")
                    }
                    
                    // 내비게이션바 오른쪽에 아이템 배치
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Image(systemName: "trash.fill")
                            .foregroundColor(.red)
                    }
                }
        }
    }
}

struct Example_Navigation_Previews: PreviewProvider {
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
            Example06()
                .previewDisplayName("Example06")
        }
        
    }
}
