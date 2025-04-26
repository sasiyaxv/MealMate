import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var recentSearches: [String] = [
        "Chicken Curry", "Pasta", "Avocado Toast", "Pancakes"
    ]

    var body: some View {
        NavigationView {
            VStack {
                // Search Field
                HStack {
                    TextField("Search recipes...", text: $searchText)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)

                    Button(action: {
                        if !searchText.isEmpty {
                            addToRecent(searchText)
                            searchText = ""
                        }
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)
                            .padding(.horizontal, 8)
                    }
                }
                .padding()

                // Recent Searches Section
                if !recentSearches.isEmpty {
                    List {
                        Section(header:
                                    HStack {
                                        Text("Recent Searches")
                                        Spacer()
                                        Button("Clear All") {
                                            recentSearches.removeAll()
                                        }
                                        .font(.caption)
                                        .foregroundColor(.red)
                                    }
                        ) {
                            ForEach(recentSearches.reversed(), id: \.self) { term in
                                Text(term)
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                } else {
                    Spacer()
                    Text("No recent searches")
                        .foregroundColor(.gray)
                    Spacer()
                }

                Spacer()
            }
            .navigationTitle("Search")
        }
    }

    private func addToRecent(_ term: String) {
        if !recentSearches.contains(term) {
            recentSearches.append(term)
        }
    }
}
