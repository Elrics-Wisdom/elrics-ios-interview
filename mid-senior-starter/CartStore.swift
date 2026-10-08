import Foundation

@MainActor
final class CartStore: ObservableObject {
    @Published private(set) var ids: Set<Int> = []

    private let key = "cart.ids"

    init() {
        // TODO 4: load saved ids from UserDefaults
    }

    func add(_ id: Int) {
        ids.insert(id)
        save()
    }

    func remove(_ id: Int) {
        ids.remove(id)
        save()
    }

    func contains(_ id: Int) -> Bool { ids.contains(id) }
    var count: Int { ids.count }

    private func save() {
        // TODO 4: persist ids to UserDefaults
    }
}
