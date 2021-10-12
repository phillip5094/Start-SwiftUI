//
//  Example_Alert.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/10.
//

import SwiftUI

fileprivate struct Example01: View {
    @State private var showAlert: Bool = false
    var body: some View {
        Button(action: { showAlert.toggle() }) {
            Text("Alert 창 출력")
        }
        .alert("Alert Title", isPresented: $showAlert) {
            // 버튼을 추가하지 않으면 기본적으로 OK버튼이 출력됩니다.
        } message: {
            Text("Alert message")
        }
    }
}

fileprivate struct Example02: View {
    @State private var showAlert: Bool = false
    var body: some View {
        Button(action: { showAlert.toggle() }) {
            Text("Alert 창 출력")
        }
        .alert("Alert Title", isPresented: $showAlert) {
            Button(action: {}) {
                Text("추가")
            }
            // .cancel을 사용해서 취소 버튼을 만들 수 있습니다.
            Button(role: .cancel, action: {}) {
                Text("취소")
            }
            // Label을 넣었지만 person 이미지는 생략되었습니다.
            Button(action: {}) {
                Label("라벨 (이미지는 생략됨)", image: "person")
            }
        }
    }
}

fileprivate struct Example03: View {
    @State var isShowingDialog: Bool = false
    var body: some View {
        Button(role: .destructive, action: { isShowingDialog.toggle() }) {
            Text("Delete Trash")
        }
        .buttonStyle(.bordered)
        .confirmationDialog("Are you sure?", isPresented: $isShowingDialog) {
            // destructive 버튼 생성
            Button("Delete Trash", role: .destructive) { }
        } message: {
            Text("You cannot undo this action.")
        }
    }
}

fileprivate struct Example04: View {
    @State private var showSheet: Bool = false
    var body: some View {
        Button(action: { showSheet.toggle() }) {
            Text("Sheet 출력")
        }
        .sheet(isPresented: $showSheet) {   // content가 모달로 열립니다.
            // dismiss action 입니다.
        } content: {
            // 모달로 열릴 뷰입니다.
            Color.yellow
                .overlay(Text("Modal View"))
                .ignoresSafeArea()
                // .interactiveDismissDisabled()   // 스와이프로 모달창이 닫히지 않게 해줍니다.
        }
    }
}

fileprivate struct Example05: View {
    @State private var showSheet: Bool = false
    var body: some View {
        Button(action: { showSheet.toggle() }) {
            Text("Sheet(fullScreen) 출력")
        }
        .fullScreenCover(isPresented: $showSheet) { // content가 전체화면으로 열립니다.
            // dismiss action 입니다.
        } content: {
            // 전체화면으로 열릴 뷰입니다.
            Color.yellow
                .overlay(Text("Modal View"))
                .ignoresSafeArea()
        }
    }
}

struct Example_Alert_Previews: PreviewProvider {
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
