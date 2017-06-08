import UIKit

/// Top/header background layout
public class TopBackgroundLayout: BackgroundLayout {

    /// Instantiate layout
    ///
    /// - Parameter inset: optional custom inset, when nil - value from scroll view will be used
    public init(inset: UIEdgeInsets? = nil) {
        self.inset = inset
    }

    // MARK: BackgroundLayout

    public func setupLayout(for view: UIView, in scrollView: UIScrollView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutIfNeeded()
        let constraints = Constraints(view)

        let topConstraint = constraints.topToSuperview
        topConstraint.constant = top(forViewIn: scrollView)
        topConstraint.isActive = true

        let leftConstraint = constraints.leftToSuperview
        leftConstraint.constant = left(forViewIn: scrollView)
        leftConstraint.isActive = true

        let widthConstraint = constraints.width
        widthConstraint.constant = width(forViewIn: scrollView)
        widthConstraint.isActive = true
    }

    public func updateLayout(for view: UIView, in scrollView: UIScrollView) {
        let constraints = Constraints(view)
        constraints.topToSuperview.constant = top(forViewIn: scrollView)
        constraints.leftToSuperview.constant = left(forViewIn: scrollView)
        constraints.width.constant = width(forViewIn: scrollView)
    }

    // MARK: Private

    private let inset: UIEdgeInsets?

    private func inset(for scrollView: UIScrollView) -> UIEdgeInsets {
        if let inset = inset {
            return inset
        }
        return scrollView.contentInset
    }

    private func top(forViewIn scrollView: UIScrollView) -> CGFloat {
        let inset = self.inset(for: scrollView)
        let offset = scrollView.contentOffset
        let minTop = -scrollView.contentInset.top + inset.top
        return min(minTop, offset.y + inset.top)
    }

    private func left(forViewIn scrollView: UIScrollView) -> CGFloat {
        let inset = self.inset(for: scrollView)
        let offset = scrollView.contentOffset
        return offset.x + inset.left
    }

    private func width(forViewIn scrollView: UIScrollView) -> CGFloat {
        let inset = self.inset(for: scrollView)
        return scrollView.frame.width - inset.left - inset.right
    }

}
