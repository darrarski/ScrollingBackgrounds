import UIKit

public class CenterBackgroundLayout: BackgroundLayout {

    public init(inset: UIEdgeInsets? = nil) {
        self.inset = inset
    }

    // MARK: BackgroundLayout

    public func setupLayout(for view: UIView, in scrollView: UIScrollView) {
        view.translatesAutoresizingMaskIntoConstraints = false

        let centerXconstraint = self.centerXconstraint(for: view)
        centerXconstraint.constant = centerX(forViewIn: scrollView)
        centerXconstraint.isActive = true

        let centerYconstraint = self.centerYconstraint(for: view)
        centerYconstraint.constant = centerY(forViewIn: scrollView)
        centerYconstraint.isActive = true
    }

    public func updateLayout(for view: UIView, in scrollView: UIScrollView) {
        centerXconstraint(for: view).constant = centerX(forViewIn: scrollView)
        centerYconstraint(for: view).constant = centerY(forViewIn: scrollView)
    }

    // MARK: Private

    private let inset: UIEdgeInsets?

    private func inset(for scrollView: UIScrollView) -> UIEdgeInsets {
        if let inset = inset {
            return inset
        }
        return scrollView.contentInset
    }

    private func centerXconstraint(for view: UIView) -> NSLayoutConstraint {
        guard let superview = view.superview else { fatalError() }
        return superview.constraints
            .filter { $0.firstAnchor == view.centerXAnchor && $0.secondAnchor == superview.centerXAnchor }
            .first ?? view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
    }

    private func centerYconstraint(for view: UIView) -> NSLayoutConstraint {
        guard let superview = view.superview else { fatalError() }
        return superview.constraints
            .filter { $0.firstAnchor == view.centerYAnchor && $0.secondAnchor == superview.centerYAnchor }
            .first ?? view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
    }

    private func centerX(forViewIn scrollView: UIScrollView) -> CGFloat {
        let inset = self.inset(for: scrollView)
        return scrollView.contentOffset.x + (inset.left - inset.right) / 2
    }

    private func centerY(forViewIn scrollView: UIScrollView) -> CGFloat {
        let inset = self.inset(for: scrollView)
        return scrollView.contentOffset.y + (inset.top - inset.bottom) / 2
    }

}
