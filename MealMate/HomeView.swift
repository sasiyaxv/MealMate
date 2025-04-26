import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}

struct HomeView: View {
    private let recipes: [Recipe] = [
        .init(title: "Spaghetti Carbonara", imageName: "carbonara"),
        .init(title: "Chicken Tikka Masala", imageName: "tikka"),
        .init(title: "Avocado Toast", imageName: "avocado"),
        .init(title: "Pancakes", imageName: "pancakes")
    ]

    @State private var currentIndex = 0
    private let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentIndex) {
                    ForEach(Array(recipes.enumerated()), id: \.element.id) { idx, recipe in
                        ZStack {
                            Image(recipe.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 250)
                                .clipped()
                                .cornerRadius(12)
                            Text(recipe.title)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                                .padding()
                                .background(Color.black.opacity(0.4))
                                .cornerRadius(8)
                                .padding([.bottom], 16)
                                .position(x: UIScreen.main.bounds.width/2, y: 220)
                        }
                        .tag(idx)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 250)
                .onReceive(timer) { _ in
                    withAnimation {
                        currentIndex = (currentIndex + 1) % recipes.count
                    }
                }

                Spacer()
                // you can add more sections here: featured lists, categories, etc.
            }
            .padding(.top)
            .navigationTitle("Discover")
        }
    }
}

#Preview {
    HomeView()
}
