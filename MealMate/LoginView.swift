import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var showSignup = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                TextField("Username or Email", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
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

                Button(action: {
                    // Handle login
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    // Placeholder for Google login
                }) {
                    HStack {
                        Image(systemName: "globe") // Replace with Google icon if using one
                        Text("Continue with Gmail")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }

                HStack {
                    Text("Don't have an account?")
                    Button("Sign up") {
                        showSignup.toggle()
                    }
                }
                .padding(.top, 10)

                NavigationLink(destination: SignupView(), isActive: $showSignup) {
                    EmptyView()
                }
            }
            .padding()
        }
    }
}
