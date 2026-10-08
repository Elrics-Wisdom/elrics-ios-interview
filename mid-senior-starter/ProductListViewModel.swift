import Foundation

@MainActor
final class ProductListViewModel: ObservableObject {
    enum State: Equatable {
        case idle, loading, loaded([Product]), failed(String)
    }

    @Published private(set) var state: State = .idle
    @Published var sortAscending = true
    @Published var query = ""

    private let service: ProductService

    init(service: ProductService = LiveProductService()) {
        self.service = service
    }

    // TODO 2: implement load()
    // - set .loading, try await service.fetchProducts()
    // - on success: .loaded(products), on fail: .failed(error.localizedDescription)
    func load() async {
        fatalError("Candidate to implement")
    }

    // TODO 2b: computed filtered + sorted products from .loaded case
    var visibleProducts: [Product] { [] }
}
