import SwiftUI

struct SignupView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            HStack {
                if isPasswordVisible {
                    TextField("Password", text: $password)
                } else {
                    SecureField("Password", text: $password)
                }
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
            .padding(10)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)

            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                // Handle sign up
            }) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
    }
}
