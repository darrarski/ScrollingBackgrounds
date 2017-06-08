import UIKit

class ViewController: UITableViewController {

    init() {
        super.init(style: .plain)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.defaultReuseIdentifier)
    }

    // MARK: UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section == 0 else { fatalError() }
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section == 0 else { fatalError() }

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Cell.defaultReuseIdentifier,
            for: indexPath
        ) as? Cell else { fatalError() }

        switch indexPath.row {
        case 0:
            cell.rectView.backgroundColor = .clear
            cell.rectView.layer.borderColor = UIColor.darkGray.cgColor
            cell.rectView.layer.borderWidth = 1
            cell.label.text = "Header cell"
        case 1:
            cell.rectView.backgroundColor = .lightGray
            cell.rectView.layer.borderColor = UIColor.clear.cgColor
            cell.rectView.layer.borderWidth = 0
            cell.label.text = "Content cell"
        case 2:
            cell.rectView.backgroundColor = .clear
            cell.rectView.layer.borderColor = UIColor.darkGray.cgColor
            cell.rectView.layer.borderWidth = 1
            cell.label.text = "Footer cell"
        default:
            fatalError()
        }

        return cell
    }

    // MARK: UITableViewDelegate

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section == 0 else { fatalError() }
        switch indexPath.row {
        case 0: return 200
        case 1: return 600
        case 2: return 200
        default: fatalError()
        }
    }

}
