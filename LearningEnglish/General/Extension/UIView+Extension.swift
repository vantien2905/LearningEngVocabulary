//
//  UIView+extension.swift
//  CodeBaseNetWork
//
//  Created by Kai Pham on 12/28/17.
//  Copyright © 2017 Kai Pham. All rights reserved.
//

import UIKit

// MARK: helper

extension UIView {
    func setBorder(borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear, cornerRadius: CGFloat) {
        self.layer.masksToBounds = true         //---
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
    }
    
    func setShadow(color: UIColor =  UIColor.clear, shadowOffset: CGSize = CGSize(width: 0, height: 1), shadowOpacity: Float = 1, shadowRadius: CGFloat = 2.5) {
        self.layer.cornerRadius = shadowRadius
        self.layer.masksToBounds = false            //---
        self.layer.shadowColor =  color.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
    }
}

// MARK: Auto Layout
extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    // TODOs: with Supper view
    
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            if #available(iOS 11.0, *) {
                leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor).isActive = true
                rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor).isActive = true
                topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
                bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
                rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
                topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
                bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            }
        }
    }
    
    func fillHorizontalSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            if #available(iOS 11, *) {
                leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor, constant: constant).isActive = true
                rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor, constant: -constant).isActive = true
            } else {
                leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
                rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
            }
        }
    }
    
    func fillVerticalSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            if #available(iOS 11, *) {
                topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
                bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
            } else {
                topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
            }
            
        }
    }
    
    func anchor(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        _ = anchorWithReturnAnchors(top, left: left, bottom: bottom, right: right, topConstant: topConstant, leftConstant: leftConstant, bottomConstant: bottomConstant, rightConstant: rightConstant, widthConstant: widthConstant, heightConstant: heightConstant)
    }
    
    private func anchorWithReturnAnchors(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
    
    func centerXToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            if let anchor = superview?.safeAreaLayoutGuide.centerXAnchor {
                centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            }
        } else {
            if let anchor = superview?.centerXAnchor {
                centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            }
        }
    }
    
    func centerYToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            if let anchor = superview?.safeAreaLayoutGuide.centerYAnchor {
                centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            }
        } else {
            if let anchor = superview?.centerYAnchor {
                centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            }
        }
    }
    
    func centerSuperview() {
        centerXToSuperview()
        centerYToSuperview()
    }
    
    // TODOs: With other view
    func fillToView(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11.0, *) {
            leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
            rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        } else {
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
            topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        }
        
    }
    
    func centerXToView(view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11, *) {
            centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: constant).isActive = true
        } else {
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
        }
    }
    
    func centerYToView(view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *) {
            centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: constant).isActive = true
        } else {
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        }
        
    }
    
    func centerToView(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXToView(view: view)
        centerYToView(view: view)
    }
    
    func fillHorizontalToView(view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: constant).isActive = true
            rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -constant).isActive = true
        } else {
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -constant).isActive = true
        }
        
    }
    
    func fillVerticalToView(view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
        } else {
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
        }
        
    }
    
}
