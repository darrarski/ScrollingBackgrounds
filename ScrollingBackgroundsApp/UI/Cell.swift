import UIKit

class Cell: UITableViewCell {

    static let defaultReuseIdentifier = "Cell"

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        loadSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews

    let rectView = UIView(frame: .zero)
    let label = UILabel(frame: .zero)

    private func loadSubviews() {
        contentView.addSubview(rectView)
        rectView.addSubview(label)
    }

    // MARK: Layout

    private func setupLayout() {
        guard let rectViewSuperview = rectView.superview else { fatalError() }
        rectView.translatesAutoresizingMaskIntoConstraints = false
        rectView.topAnchor.constraint(equalTo: rectViewSuperview.topAnchor, constant: 16).isActive = true
        rectView.leftAnchor.constraint(equalTo: rectViewSuperview.leftAnchor, constant: 16).isActive = true
        rectView.rightAnchor.constraint(equalTo: rectViewSuperview.rightAnchor, constant: -16).isActive = true
        rectView.bottomAnchor.constraint(equalTo: rectViewSuperview.bottomAnchor, constant: -16).isActive = true

        guard let labelSuperview = label.superview else { fatalError() }
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: labelSuperview.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: labelSuperview.centerYAnchor).isActive = true
    }
    
}
