//
//  Example_Button.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/08.
//

import SwiftUI

fileprivate struct Example01: View {
    var body: some View {
        HStack {
            Button("String-Btn") {
                // action에 해당합니다.
            }
            
            Button(action: { /*action에 해당합니다.*/ }) {
                Text("Text-Btn")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
            }
            
            Button {
                // action에 해당합니다.
            } label: {
                Image(systemName: "person.circle")
                    .font(.title)
            }
            .foregroundColor(.red)
            
            Button {
                // action에 해당합니다.
            } label: {
                Circle()
                    .frame(width: 50, height: 50)
            }
        }
    }
}

fileprivate struct Example02: View {
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("Plain Style").font(.title)
            }
            .buttonStyle(.plain)
            
            Button(action: {}) {
                Text("Bordered Style").font(.title)
            }
            .buttonStyle(.bordered)
            
            Button(action: {}) {
                Text("Borderless Style").font(.title)
            }
            .buttonStyle(.borderless)
            
            Button(action: {}) {
                Text("BorderedProminent Style").font(.title)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

fileprivate struct Example03: View {
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text("Bordered Style : ")
                Button(action: {}) {
                    Text("Bordered Style")
                }
                .buttonStyle(.bordered)
                .tint(.orange)
            }
            
            HStack {
                Text("Bordered Style (large) : ")
                Button(action: {}) {
                    Text("Bordered Style")
                }
                .buttonStyle(.bordered)
                .tint(.pink)
                .controlSize(.large)
            }
        }
    }
}

fileprivate struct Example04: View {
    var body: some View {
        Menu("+ Add") {
            Button("Home") {}
            Button(action: {}) {
                HStack {
                    Text("Add cart")
                    Image(systemName: "cart")
                }
            }
            Button(action: {}) {
                HStack {
                    Text("Add image")
                    Image("street")
                }
            }
        }
    }
}

fileprivate struct Example05: View {
    // 토글 상태값(true, false)을 가지고 있는 변수
    @State var toggleSwitchStyle: Bool = true
    @State var toggleButtonStyle: Bool = true
    var body: some View {
        VStack {
            // switch 스타일
            Toggle(isOn: $toggleSwitchStyle) {
                Text("토글 switch 스타일")
            }
            .toggleStyle(.switch)
            
            // 버튼 스타일
            Toggle(isOn: $toggleButtonStyle) {
                Label("토글 button 스타일", systemImage: "sparkles")
                    
            }
            .toggleStyle(.button)
        }
        .frame(width: 200, height: 300)
    }
}

struct Example_Button_Previews: PreviewProvider {
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
