import UIKit

public class BottomBackgroundLayout: BackgroundLayout {

    public init(inset: UIEdgeInsets? = nil) {
        self.inset = inset
    }

    // MARK: BackgroundLayout

    public func setupLayout(for view: UIView, in scrollView: UIScrollView) {
        view.translatesAutoresizingMaskIntoConstraints = false

        let topConstraint = self.topConstraint(for: view)
        topConstraint.constant = top(for: view, in: scrollView)
        topConstraint.isActive = true

        let leftConstraint = self.leftConstraint(for: view)
        leftConstraint.constant = left(forViewIn: scrollView)
        leftConstraint.isActive = true

        let widthConstraint = self.widthConstraint(for: view)
        widthConstraint.constant = width(forViewIn: scrollView)
        widthConstraint.isActive = true
    }

    public func updateLayout(for view: UIView, in scrollView: UIScrollView) {
        topConstraint(for: view).constant = top(for: view, in: scrollView)
        leftConstraint(for: view).constant = left(forViewIn: scrollView)
        widthConstraint(for: view).constant = width(forViewIn: scrollView)
    }

    // MARK: Private

    private let inset: UIEdgeInsets?

    private func inset(for scrollView: UIScrollView) -> UIEdgeInsets {
        if let inset = inset {
            return inset
        }
        return scrollView.contentInset
    }

    private func topConstraint(for view: UIView) -> NSLayoutConstraint {
        guard let superview = view.superview else { fatalError() }
        return superview.constraints
            .filter { $0.firstAnchor == view.topAnchor && $0.secondAnchor == superview.topAnchor }
            .first ?? view.topAnchor.constraint(equalTo: superview.topAnchor)
    }

    private func leftConstraint(for view: UIView) -> NSLayoutConstraint {
        guard let superview = view.superview else { fatalError() }
        return superview.constraints
            .filter { $0.firstAnchor == view.leftAnchor && $0.secondAnchor == superview.leftAnchor }
            .first ?? view.leftAnchor.constraint(equalTo: superview.leftAnchor)
    }

    private func widthConstraint(for view: UIView) -> NSLayoutConstraint {
        return view.constraints
            .filter { $0.firstAnchor == view.widthAnchor && $0.secondAnchor == nil }
            .first ?? view.widthAnchor.constraint(equalToConstant: 0)
    }

    private func top(for view: UIView, in scrollView: UIScrollView) -> CGFloat {
        let inset = self.inset(for: scrollView)
        let offset = scrollView.contentOffset
        let scrollViewSize = scrollView.frame.size
        let scrollContentHeight = scrollView.contentSize.height
        let viewHeight = view.frame.size.height
        let minTop = scrollContentHeight - viewHeight
        let topOffset = offset.y + scrollViewSize.height - inset.bottom - scrollContentHeight
        let minTopOffset = scrollView.contentInset.bottom - inset.bottom
        return minTop + max(minTopOffset, topOffset)
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
