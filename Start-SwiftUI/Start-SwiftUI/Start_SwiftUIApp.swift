//
//  Start_SwiftUIApp.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/01.
//

import SwiftUI

// SwiftUI는 App-Scene-View 구조를 가지고 있습니다.

@main                               // 앱의 entry point라는 것을 의미합니다.
struct Start_SwiftUIApp: App {      // App
    var body: some Scene {
        WindowGroup {               // Scene
            ContentView()           // View (앱 처음 시작할 때의 뷰)
        }
    }
}
