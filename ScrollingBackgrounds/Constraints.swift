import UIKit

struct Constraints {

    init(_ view: UIView) {
        self.view = view
    }

    let view: UIView

    var topToSuperview: NSLayoutConstraint {
        guard let superview = view.superview else { fatalError() }
        return superview.constraints
            .first { $0.firstAnchor == view.topAnchor && $0.secondAnchor == superview.topAnchor }
            ?? view.topAnchor.constraint(equalTo: superview.topAnchor)
    }

    var leftToSuperview: NSLayoutConstraint {
        guard let superview = view.superview else { fatalError() }
        return superview.constraints
            .first { $0.firstAnchor == view.leftAnchor && $0.secondAnchor == superview.leftAnchor }
            ?? view.leftAnchor.constraint(equalTo: superview.leftAnchor)
    }

    var width: NSLayoutConstraint {
        return view.constraints
            .first { $0.firstAnchor == view.widthAnchor && $0.secondAnchor == nil }
            ?? view.widthAnchor.constraint(equalToConstant: 0)
    }

    var centerX: NSLayoutConstraint {
        guard let superview = view.superview else { fatalError() }
        return superview.constraints
            .first { $0.firstAnchor == view.centerXAnchor && $0.secondAnchor == superview.centerXAnchor }
            ?? view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
    }

    var centerY: NSLayoutConstraint {
        guard let superview = view.superview else { fatalError() }
        return superview.constraints
            .first { $0.firstAnchor == view.centerYAnchor && $0.secondAnchor == superview.centerYAnchor }
            ?? view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
    }

}
