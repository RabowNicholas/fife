
import SwiftUI
import UIKit
import PhoneNumberKit
import FirebaseAuth

struct PhoneNumberEntry: View {

    @Binding var authFlowPath: [AuthFlowViewEnum]
    @State var number:String = ""
    
    var authService: AuthService = AuthService()

    var body: some View {
        ZStack {
            FifeColor.backgroundColor.ignoresSafeArea()
            VStack {
                Text("Phone Number")
                    .foregroundColor(.white)
                    .frame(width: 350, alignment: .leading)
                PhoneNumberField(phoneNumber: $number)
                    .frame(width: 350, height: 64)
                    .padding(EdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(
                        FifeColor.grey, style: StrokeStyle(lineWidth: 1.0)))
                    .keyboardType(.phonePad)
                Button("Send code") {
                    let sentSuccess: Bool = authService.sendVerificationCode(phoneNumber: number)
                    if (sentSuccess) {
                        authFlowPath.append(AuthFlowViewEnum.phoneVerify)
                    } else {
                        print("error")
                    }
                }
                .withTightButtonViewModifier(backgroundColor: FifeColor.pink)
                .padding()
            }.padding(50)
        }
        .toolbar(.hidden)
    }
}

struct PhoneNumberField: UIViewRepresentable {
    
    @Binding var phoneNumber: String
    private let textField = PhoneNumberTextField()
 
    func makeUIView(context: Context) -> PhoneNumberTextField {
        textField.withPrefix = true
        textField.withExamplePlaceholder = true
        textField.textColor = .white
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 24)
        textField.becomeFirstResponder()
        textField.addTarget(context.coordinator, action: #selector(Coordinator.onTextUpdate), for: .editingChanged)
        return textField
    }
    
    func updateUIView(_ view: PhoneNumberTextField, context: Context) {

    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {

        var control: PhoneNumberField

        init(_ control: PhoneNumberField) {
            self.control = control
        }

        @objc func onTextUpdate(textField: UITextField) {
            self.control.phoneNumber = textField.text!
        }

    }

}

struct PhoneNumberEntry_Previews: PreviewProvider {
    @State static var path: [AuthFlowViewEnum] =  []
    static var previews: some View {
            PhoneNumberEntry(authFlowPath: $path)
    }
}

