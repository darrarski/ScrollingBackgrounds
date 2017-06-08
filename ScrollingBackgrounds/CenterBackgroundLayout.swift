import UIKit
import SnapKit

public class CenterBackgroundLayout: BackgroundLayout {

    public init(inset: UIEdgeInsets? = nil) {
        self.inset = inset
    }

    // MARK: BackgroundLayout

    public func setupLayout(for view: UIView, in scrollView: UIScrollView) {
        view.snp.makeConstraints(constraintMaker(forViewIn: scrollView))
    }

    public func updateLayout(for view: UIView, in scrollView: UIScrollView) {
        view.snp.updateConstraints(constraintMaker(forViewIn: scrollView))
    }

    // MARK: Private

    private let inset: UIEdgeInsets?

    private func inset(for scrollView: UIScrollView) -> UIEdgeInsets {
        if let inset = inset {
            return inset
        }
        return scrollView.contentInset
    }

    private func constraintMaker(forViewIn scrollView: UIScrollView) -> (ConstraintMaker) -> Void {
        return { [unowned self] in
            $0.centerX.equalTo(self.centerX(forViewIn: scrollView))
            $0.centerY.equalTo(self.centerY(forViewIn: scrollView))
        }
    }

    private func centerX(forViewIn scrollView: UIScrollView) -> CGFloat {
        return scrollView.contentOffset.x + (scrollView.frame.width + inset(for: scrollView).left) / 2
    }

    private func centerY(forViewIn scrollView: UIScrollView) -> CGFloat {
        return scrollView.contentOffset.y + (scrollView.frame.height + inset(for: scrollView).top) / 2
    }

}
