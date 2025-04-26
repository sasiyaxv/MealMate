import SwiftUI
import PhotosUI

struct AccountView: View {
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var notes: String = ""
    
    @State private var profileImage: UIImage? = nil
    @State private var isPickerPresented = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // Profile Image
                ZStack {
                    if let image = profileImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    } else {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 120, height: 120)
                            .overlay(
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.gray)
                            )
                    }
                }
                .onTapGesture {
                    isPickerPresented = true
                }
                .padding(.top)

                // Form Fields
                Form {
                    Section(header: Text("Profile Details")) {
                        TextField("Name", text: $name)
                        TextField("Age", text: $age)
                            .keyboardType(.numberPad)
                        TextEditor(text: $notes)
                            .frame(height: 100)
                    }
                }
                
                // Save Button (placeholder action)
                Button(action: {
                    // Save to CoreData or UserDefaults
                    print("Saving profile: \(name), \(age), \(notes)")
                }) {
                    Text("Save")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding([.horizontal, .bottom])
            }
            .sheet(isPresented: $isPickerPresented) {
                PhotoPicker(image: $profileImage)
            }
            .navigationTitle("Account")
        }
    }
}
