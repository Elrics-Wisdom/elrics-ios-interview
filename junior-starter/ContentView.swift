import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    @State private var searchText = ""
    @State private var isLoading = false
    @State private var errorMessage: String?

    private let service = UserService()

    var filteredUsers: [User] {
        // TODO 3b: filter by searchText (name contains, case-insensitive)
        users
    }

    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage {
                    // TODO 4 (bonus): make this nicer with Retry button
                    Text("Error: \(errorMessage)")
                } else {
                    List(filteredUsers) { user in
                        NavigationLink(destination: UserDetailView(user: user)) {
                            VStack(alignment: .leading) {
                                Text(user.name).font(.headline)
                                // TODO 3a: show email + city here
                                Text("TODO: email + city")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    // TODO 4 (bonus): add .refreshable { await load() }
                    // TODO 3c: add .searchable(text: $searchText)
                }
            }
            .navigationTitle("Users")
            .task {
                await load()
            }
        }
    }

    func load() async {
        // TODO 3: call service.fetchUsers(), update users / errorMessage / isLoading
        // Hint: isLoading = true at start, false at end. Use do/catch.
    }
}

struct UserDetailView: View {
    let user: User
    var body: some View {
        // TODO: show name, email, city in a Form/VStack
        Text(user.name)
    }
}
