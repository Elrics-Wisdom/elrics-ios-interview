import SwiftUI

struct ContentView: View {
    @StateObject private var vm: ProductListViewModel
    @StateObject private var cart = CartStore()

    init(vm: ProductListViewModel = ProductListViewModel()) {
        _vm = StateObject(wrappedValue: vm)
    }

    var body: some View {
        NavigationStack {
            Group {
                switch vm.state {
                case .idle, .loading:
                    ProgressView("Loading products...")
                case .failed(let msg):
                    VStack(spacing: 12) {
                        Text("Failed: \(msg)")
                        Button("Retry") { Task { await vm.load() } }
                    }
                case .loaded:
                    // TODO 3: List(vm.visibleProducts) with AsyncImage, title, price
                    // + navigation to detail with Add to Cart button
                    // + .searchable + sort toggle + cart badge in toolbar
                    List(vm.visibleProducts) { p in
                        HStack {
                            AsyncImage(url: URL(string: p.image)) { img in
                                img.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text(p.title).lineLimit(2)
                                Text("$\(p.price, specifier: "%.2f")").bold()
                            }
                        }
                    }
                    .searchable(text: Binding(
                        get: { vm.query }, set: { vm.query = $0 }
                    ))
                }
            }
            .navigationTitle("Store (\(cart.count))")
            .task { await vm.load() }
        }
    }
}
