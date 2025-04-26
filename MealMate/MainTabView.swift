import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            SearchView()   // stub for later
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }

            AccountView()  // stub for later
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Account")
                }
        }
    }
}

#Preview {
    MainTabView()
}
