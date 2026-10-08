# Mid / Senior - Mini Store (75-90 min Live)

**Setup:** Xcode 15+ > New Project > iOS App > SwiftUI > Name: MiniStoreStarter. Add these files. Internet ON.

## Candidate Brief

> Build a Product Catalog using https://fakestoreapi.com/products
> List (image, title, price). Detail + Add to Cart. Cart count persists after restart. Use MVVM + protocol service.
> No AI/chat. Docs allowed.

## Tasks in order
1. `ProductService.swift` - implement `LiveProductService` with async/await (15 min)
2. `ProductListViewModel.swift` - implement load() with loading/error states, sorting (20 min)
3. `ContentView.swift` - list + AsyncImage cache + search/sort + navigation (20 min)
4. `CartStore.swift` - add/remove + persist with UserDefaults (15 min)
5. Bonus: code-review `BadCodeReview.swift` - find 5+ bugs live (10 min)
6. Discussion: how to unit test ViewModel with Mock service?
