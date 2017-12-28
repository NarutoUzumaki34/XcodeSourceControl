import UIKit

class TableViewController: UITableViewController {
    let viewModel = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadData { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

//MARK: - UITableViewDataSource
extension TableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowType = viewModel.rowType(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as! CustomCell
        
        let decorator = CellDecorator()
            decorator.decorate(cell, rowType)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK: - UITableViewDelegate
extension TableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowType = viewModel.rowType(at: indexPath.row)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            detailViewController.configure(rowType: rowType)
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

//MARK: - Other
extension TableViewController {
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

//MARK: - Source Control example
extension TableViewController {
    func makeSomeChanges() {
        
    }
}
