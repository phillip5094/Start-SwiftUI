//
//  Example_UIKit.swift
//  Start-SwiftUI
//
//  Created by NHN on 2021/10/12.
//

import UIKit
import SwiftUI

//MARK: Example01 - UIAlertController with UITextField
fileprivate struct Example01: View {
    @State var textString: String = "Enter Text"
    @State var showAlert: Bool = false
    var body: some View {
        VStack {
            Button(action: { showAlert.toggle() }) {
                Text(textString)
            }
            .textFieldAlert(title: "Alert with TextField",
                            message: "message",
                            isPresented: $showAlert,
                            textString: $textString)
        }
    }
}

fileprivate extension View {
    func textFieldAlert(title: String?, message: String?, isPresented: Binding<Bool>, textString: Binding<String>) -> some View {
        background(TextFieldAlert(title: title, message: message, isPresented: isPresented, textString: textString))
    }
}

fileprivate struct TextFieldAlert: UIViewControllerRepresentable {
    var title: String?              // Alert 화면의 title
    var message: String?            // Alert 화면의 message
    @Binding var isPresented: Bool  // 값이 true가 되면 Alert 화면을 출력
    @Binding var textString: String // 사용자가 입력한 text 정보를 저장할 Binding 변수
    
    func makeUIViewController(context: Context) -> some UIViewController {
        // .present(UIAlertController(...)) 를 할 것이기 때문에 UIViewController()를 반환해줍니다.
        return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if self.isPresented {        // isPresented = true 일 경우 화면 출력
            let alert = UIAlertController(title: self.title, message: self.message, preferredStyle: .alert)
            
            // textField 추가
            alert.addTextField { textField in
                textField.placeholder = "Enter text"
                // textField delegate 등록
                textField.delegate = context.coordinator
            }
            
            // OK 버튼 추가
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                // OK 버튼이 눌렀을 경우, 현재 alert 화면을 닫고 isPresented = false로 변경
                alert.dismiss(animated: true) {
                    self.isPresented = false
                }
            }))
            
            DispatchQueue.main.async {
                // alert 창 화면에 출력
                uiViewController.present(alert, animated: true) {
                    self.isPresented = false
                }
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    // delegate 처리를 위한 Coordinator
    class Coordinator: NSObject, UITextFieldDelegate {
        let alert: TextFieldAlert
        
        init(_ alert: TextFieldAlert) {
            self.alert = alert
        }
        
        // textField delegate
        func textFieldDidEndEditing(_ textField: UITextField) {
            // 입력이 끝났을 때, Binding 변수에 값 설정
            if let text = textField.text, text.count > 0 {
                self.alert.textString = text
            } else {
                self.alert.textString = "Enter Text"
            }
        }
    }
}

struct Example_UIKit_Previews: PreviewProvider {
    static var previews: some View {
        Example01()
            .previewDisplayName("Example01")
    }
}

//MARK: Example02 - Using Preview for UIKit views
fileprivate class MyViewController: UIViewController {
    let myLabel: UILabel = {
        let label = UILabel()
        label.text = "This is UIViewController"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myLabel)
        NSLayoutConstraint.activate([
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

fileprivate struct MyView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return MyViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
            .previewDisplayName("MyView")
    }
}
