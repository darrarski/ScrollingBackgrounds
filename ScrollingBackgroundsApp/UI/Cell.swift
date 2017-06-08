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

    let label = UILabel(frame: .zero)

    private func loadSubviews() {
        contentView.addSubview(rectView)
        rectView.addSubview(blurView)
        rectView.addSubview(label)
    }

    private let rectView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()

    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))

    // MARK: Layout

    private func setupLayout() {
        guard let rectViewSuperview = rectView.superview else { fatalError() }
        rectView.translatesAutoresizingMaskIntoConstraints = false
        rectView.topAnchor.constraint(equalTo: rectViewSuperview.topAnchor, constant: 16).isActive = true
        rectView.leftAnchor.constraint(equalTo: rectViewSuperview.leftAnchor, constant: 16).isActive = true
        rectView.rightAnchor.constraint(equalTo: rectViewSuperview.rightAnchor, constant: -16).isActive = true
        rectView.bottomAnchor.constraint(equalTo: rectViewSuperview.bottomAnchor, constant: -16).isActive = true

        guard let blurViewSuperview = blurView.superview else { fatalError() }
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.topAnchor.constraint(equalTo: blurViewSuperview.topAnchor).isActive = true
        blurView.leftAnchor.constraint(equalTo: blurViewSuperview.leftAnchor).isActive = true
        blurView.rightAnchor.constraint(equalTo: blurViewSuperview.rightAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: blurViewSuperview.bottomAnchor).isActive = true

        guard let labelSuperview = label.superview else { fatalError() }
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: labelSuperview.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: labelSuperview.centerYAnchor).isActive = true
    }

}
