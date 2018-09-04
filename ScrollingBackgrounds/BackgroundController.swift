import UIKit

/// Scrolling background view controller
public class BackgroundController: NSObject {

    /// Instantiate controller
    ///
    /// - Parameters:
    ///   - layout: layout for background view
    ///   - view: background view
    ///   - scrollView: scroll view to which background view will be added
    public init(layout: BackgroundLayout, view: UIView, scrollView: UIScrollView) {
        self.layout = layout
        self.view = view
        self.scrollView = scrollView
        super.init()
        scrollView.insertSubview(view, at: 0)
        layout.setupLayout(for: view, in: scrollView)
        setupObservers()
    }

    deinit {
        removeObservers()
        view.removeFromSuperview()
    }

    private let layout: BackgroundLayout
    private let view: UIView
    private let scrollView: UIScrollView

    // MARK: KVO

    private var contentOffsetObserver: NSKeyValueObservation?
    private var contentSizeObserver: NSKeyValueObservation?
    private var contentInsetObserver: NSKeyValueObservation?

    private func setupObservers() {
        contentOffsetObserver = scrollView.observe(\UIScrollView.contentOffset, options: [.new]) { [weak self] _, _ in
            self?.updateLayout()
        }
        contentSizeObserver = scrollView.observe(\UIScrollView.contentSize, options: [.new]) { [weak self] _, _ in
            self?.updateLayout()
        }
        contentInsetObserver = scrollView.observe(\UIScrollView.contentInset, options: [.new]) { [weak self] _, _ in
            self?.updateLayout()
        }
    }

    private func removeObservers() {
        contentOffsetObserver = nil
        contentSizeObserver = nil
        contentInsetObserver = nil
    }

    private func updateLayout() {
        layout.updateLayout(for: view, in: scrollView)
    }

}
