//
//  PanelView.swift
//  PanelView
//
//  Created by 日野森寛也 on 2019/04/13.
//  Copyright © 2019 Hiroya Hinomori. All rights reserved.
//

import UIKit

public class PanelView: UIStackView {

    @IBInspectable
    public var price: Int = 0 {
        didSet {
            deploy()
        }
    }

    @IBInspectable
    public var priceFontSize: CGFloat = 10

    @IBInspectable
    public var symbolFontSize: CGFloat = 10

    @IBInspectable
    public var fontColor: UIColor = .white

    var _backgroundColor: UIColor = .darkGray

    public var panelWidth: CGFloat = 10

    public override var backgroundColor: UIColor? {
        didSet {
            guard let color = backgroundColor else {
                return
            }
            _backgroundColor = color
        }
    }

    public required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    private func commonInit() {

    }

    public func deploy() {
        arrangedSubviews.forEach { removeArrangedSubview($0) }
        createPriceLabels().forEach { addArrangedSubview($0) }
    }

    private func createPriceLabels() -> [UILabel] {
        let characters: [String] = "¥\(price)".compactMap { String($0) }
        return characters.map { (character) -> UILabel in
            let label = UILabel(frame: .zero)
            label.text = character
            if Int(character) != nil {
                label.font = .boldSystemFont(ofSize: priceFontSize)
            } else {
                label.font = .boldSystemFont(ofSize: symbolFontSize)
            }
            label.textColor = fontColor
            label.textAlignment = .center
            label.backgroundColor = _backgroundColor
            label.layer.cornerRadius = 4
            label.layer.masksToBounds = true
            label.widthAnchor.constraint(equalToConstant: panelWidth).isActive = true
            return label
        }
    }

}
