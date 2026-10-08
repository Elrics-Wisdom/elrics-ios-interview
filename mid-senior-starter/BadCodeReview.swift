import UIKit

// BAD CODE for live code-review exercise (last 15 min).
// Ask senior candidate: "Find 5+ issues and fix them."
// Issues planted: force unwrap, network on main, retain cycle,
// no HTTP check, no error UI, cell reuse image race, massive VC.

class BadProductsVC: UIViewController, UITableViewDataSource {
    var table = UITableView()
    var products: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.frame = view.bounds
        table.dataSource = self
        let url = URL(string: "https://fakestoreapi.com/products")!
        let data = try! Data(contentsOf: url) // BLOCKS MAIN THREAD
        products = try! JSONSerialization.jsonObject(with: data) as! [[String: Any]]
        table.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let p = products[indexPath.row]
        cell.textLabel!.text = p["title"] as! String
        // Image load without cache/cancel - race on reuse
        let url = URL(string: p["image"] as! String)!
        URLSession.shared.dataTask(with: url) { data, _, _ in
            cell.imageView!.image = UIImage(data: data!)
            cell.setNeedsLayout()
        }.resume()
        return cell
    }
}
