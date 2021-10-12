//
//  Example_DataManagement.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/09.
//

import SwiftUI

fileprivate struct Example01: View {
    @State private var rows: [String] = []
    var body: some View {
        NavigationView {
            List(rows, id:\.self) {
                // List를 따로 갱신해주지 않아도 알아서 갱신됩니다.
                Text($0)
            }
            .navigationTitle("StopWatch")
            .toolbar {
                HStack {
                    Button(action: {
                        // @State 프로퍼티인 rows 전체 삭제
                        rows.removeAll()
                    }) {
                        Text("Reset")
                    }
                    Button(action: {
                        // @State 프로퍼티인 rows에 현재 시간 추가
                        rows.append(Date().ISO8601Format())
                    }) {
                        Text("Split")
                    }
                }
            }
        }
    }
}

fileprivate struct Example02: View {
    @State private var isOn: Bool = true
    var body: some View {
        // 데이터 바인딩을 할 경우 `$`를 앞에 붙여줍니다.
        Toggle(isOn: $isOn) {
            Text("isOn : \(isOn.description)")
        }
        .frame(width: 200)
    }
}


private class Player: ObservableObject {
    @Published var nickname: String
    var level: Int   // Published 프로퍼티가 아니기 때문에 값이 변경되어도 뷰가 갱신되지 않습니다.
//    @Published var level: Int
    
    init(nickname: String, level: Int) {
        self.nickname = nickname
        self.level = level
    }
}

fileprivate struct Example03: View {
    @ObservedObject var player: Player
    var body: some View {
        VStack(spacing: 20) {
            Text("Nickname : \(player.nickname), level : \(player.level)")
            
            Button(action: { player.nickname += "1" }) {
                Text("Change Nickname!")
            }
            Button(action: { player.level += 1 }) {
                Text("Level up!")
            }
        }
    }
}

fileprivate struct Example04: View {
    @ObservedObject var player: Player
    var body: some View {
        VStack(spacing: 10) {
            Text("Example04 => Nickname : \(player.nickname), level : \(player.level)")
            SubView01(player: player)
        }
        
    }
}

fileprivate struct SubView01: View {
    // SubView01 뷰에서는 ObservedObject를 사용하지 않지만, SubView02에게 넘겨주기 위해서 불필요하게 선언을 해줘야 합니다.
    @ObservedObject var player: Player
    var body: some View {
        // SubView02에게 데이터 주입
        SubView02(player: player)
    }
}

fileprivate struct SubView02: View {
    @ObservedObject var player: Player
    var body: some View {
        Text("SubView02 => Nickname : \(player.nickname), level : \(player.level)")
    }
}

fileprivate struct Example05: View {
    @ObservedObject var player: Player
    var body: some View {
        VStack {
            Text("Example05 => Nickname : \(player.nickname), level : \(player.level)")
            SubView03()
                .environmentObject(player)  // ObservableObject를 등록해줍니다.
        }
    }
}

fileprivate struct SubView03: View {
    // 불필요한 ObservedObject 프로퍼티를 선언하지 않아도 됩니다.
    var body: some View {
        SubView04()
    }
}

fileprivate struct SubView04: View {
    // environmentObject로 등록을 해줬기 때문에 사용 가능합니다.
    @EnvironmentObject var player: Player
    var body: some View {
        Text("SubView04 => Nickname : \(player.nickname), level : \(player.level)")
    }
}

struct Example_DataManagement_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Example01()
                .previewDisplayName("Example01")
            Example02()
                .previewDisplayName("Example02")
            Example03(player: Player(nickname: "Philip", level: 123))
                .previewDisplayName("Example03")
            Example04(player: Player(nickname: "Philip", level: 123))
                .previewDisplayName("Example04")
            Example05(player: Player(nickname: "Philip", level: 123))
                .previewDisplayName("Example05")
        }
    }
}
