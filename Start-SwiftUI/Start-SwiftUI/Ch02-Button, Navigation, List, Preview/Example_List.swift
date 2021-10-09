//
//  Example_List.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/08.
//

import SwiftUI

fileprivate struct Example01: View {
    var body: some View {
        List {
            Text("Row 1")
            Circle().frame(width: 50, height: 50)
            Image("street").resizable().frame(width: 50, height: 50)
            HStack {
                Image(systemName: "swift")
                Spacer()
                Text("SwiftUI")
            }
        }
    }
}

private struct Person {
    let name: String
    let phoneNumber: String
    let id = UUID()     // Identifiable 프로토콜의 필수 프로퍼티
}

private var persons = [
    Person(name: "Philip", phoneNumber: "010-1111-2222"),
    Person(name: "John", phoneNumber: "010-3333-4444"),
    Person(name: "Jessie", phoneNumber: "010-5555-6666"),
    Person(name: "Tom", phoneNumber: "010-7777-8888"),
    Person(name: "Bob", phoneNumber: "010-9999-0000"),
]

fileprivate struct Example02: View {
    var body: some View {
        // phoneNumber 프로퍼티가 중복되지 않는 고유한 값일 경우
        List(persons, id:\.phoneNumber) {
            Text("\($0.name) / \($0.phoneNumber)")
        }
    }
}

extension Person: Hashable {}       // Hashable 프로토콜 준수
fileprivate struct Example03: View {
    var body: some View {
        // Hashable 프로토콜을 준수할 경우 self로 설정합니다.
        List(persons, id:\.self) {
            Text("\($0.name) / \($0.phoneNumber)")
        }
    }
}

extension Person: Identifiable {}       // Identifiable 프로토콜 준수
fileprivate struct Example04: View {
    var body: some View {
        List(persons) {
            Text("\($0.name) / \($0.phoneNumber)")
        }
    }
}

fileprivate struct Example05: View {
    var body: some View {
        List(persons) {
            Text("\($0.name) / \($0.phoneNumber)")
        }
        .refreshable {
            // refresh List (async task)
        }
    }
}

fileprivate struct Example06: View {
    var body: some View {
        List(persons) {
            Text("\($0.name) / \($0.phoneNumber)")
                .listRowSeparatorTint(.red)     // Separator 색 변경
                .listRowSeparator(.hidden)      // Separator 숨기기
        }
    }
}

private struct Region: Identifiable {
    let name: String
    let persons: [Person]
    let id = UUID()
}

private let regions: [Region] = [
    Region(name: "Asia", persons: [
        Person(name: "Philip", phoneNumber: "010-1111-2222"),
        Person(name: "John", phoneNumber: "010-3333-4444"),
    ]),
    Region(name: "Europe", persons: [
        Person(name: "Jessie", phoneNumber: "010-5555-6666"),
        Person(name: "Tom", phoneNumber: "010-7777-8888"),
        Person(name: "Bob", phoneNumber: "010-9999-0000"),
    ]),
]

fileprivate struct Example07: View {
    var body: some View {
        List {
            ForEach(regions) { region in
                Section {
                    // Section 안의 컨텐츠
                    ForEach(region.persons) { person in
                        Text("\(person.name) / \(person.phoneNumber)")
                    }
                } header: {
                    // header 뷰
                    Text("\(region.name)")
                } footer: {
                    // footer 뷰
                    Text("Total : \(region.persons.count) people")
                }
            }
        }
    }
}

fileprivate struct Example08: View {
    var body: some View {
        List {
            Section {
                Text("section1 - row1")
                Text("section1 - row2")
            } header: {
                Text("Section1 header")
            } footer: {
                Text("Section1 footer")
            }
            
            Section {
                Text("section2 - row1")
                Text("section2 - row2")
            } header: {
                Text("Section2 header")
            } footer: {
                Text("Section2 footer")
            }
        }
        .listStyle(.plain)
        .listStyle(.grouped)
        .listStyle(.inset)
        .listStyle(.insetGrouped)
        // sidebar 스타일과 비슷한 것에는 OutlineGroup, DisclosureGroup이 있습니다.
        .listStyle(.sidebar)
    }
}

struct Example_List_Previews: PreviewProvider {
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
            Example07()
                .previewDisplayName("Example07")
            Example08()
                .previewDisplayName("Example08")
        }
    }
}
