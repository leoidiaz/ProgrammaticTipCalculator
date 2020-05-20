//
//  TipperViewController.swift
//  ProgrammaticTipper
//
//  Created by Leonardo Diaz on 5/19/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class TipperViewController: UIViewController {
    //MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addAllSubViews()
        addAllStackViews()
        addViewLevelStackViewConstraints()
        addbottomButtonStackViewConstraints()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK: - Helper Methods
    
    func addAllSubViews(){
        self.view.addSubview(viewLevelComponentStackView)
        self.view.addSubview(topComponentStackView)
        self.view.addSubview(bottomComponentStackView)
        self.view.addSubview(splitStackView)
        self.view.addSubview(splitLabel)
        self.view.addSubview(splitSwitch)
        self.view.addSubview(splitStepperStackView)
        self.view.addSubview(stepperLabel)
        self.view.addSubview(splitStepper)
        
        self.view.addSubview(subtotalStackView)
        self.view.addSubview(subtotalLabel)
        self.view.addSubview(subtotalText)
        self.view.addSubview(tipStackView)
        self.view.addSubview(tipLabel)
        self.view.addSubview(percentButtonStackView)
        self.view.addSubview(tenButton)
        self.view.addSubview(fifteenButton)
        self.view.addSubview(twentyButton)
        self.view.addSubview(totalLabel)
        self.view.addSubview(bottomButtonsComponentStackView)
        self.view.addSubview(resetButton)
        self.view.addSubview(calculateButton)
    }
    
    func addAllStackViews(){
        viewLevelComponentStackView.addArrangedSubview(topComponentStackView)
        
        topComponentStackView.addArrangedSubview(subtotalStackView)
        subtotalStackView.addArrangedSubview(subtotalLabel)
        subtotalStackView.addArrangedSubview(subtotalText)
        
        topComponentStackView.addArrangedSubview(tipStackView)
        tipStackView.addArrangedSubview(tipLabel)
        
        tipStackView.addArrangedSubview(percentButtonStackView)
        percentButtonStackView.addArrangedSubview(tenButton)
        percentButtonStackView.addArrangedSubview(fifteenButton)
        percentButtonStackView.addArrangedSubview(twentyButton)
        
        viewLevelComponentStackView.addArrangedSubview(bottomComponentStackView)
        bottomComponentStackView.addArrangedSubview(splitStackView)
        splitStackView.addArrangedSubview(splitLabel)
        splitStackView.addArrangedSubview(splitSwitch)
        
        bottomComponentStackView.addArrangedSubview(splitStepperStackView)
        splitStepperStackView.addArrangedSubview(stepperLabel)
        splitStepperStackView.addArrangedSubview(splitStepper)
        
        viewLevelComponentStackView.addArrangedSubview(totalLabel)
        
        bottomButtonsComponentStackView.addArrangedSubview(resetButton)
        bottomButtonsComponentStackView.addArrangedSubview(calculateButton)
    }
    
    func addViewLevelStackViewConstraints(){
        viewLevelComponentStackView.anchor(top: safeArea.topAnchor, bottom: bottomButtonsComponentStackView.topAnchor, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 100, paddingBottom: -125, paddingLeading: 20, paddingTrailing: -20)
    }
    
    func addbottomButtonStackViewConstraints(){
        bottomButtonsComponentStackView.anchor(top: viewLevelComponentStackView.bottomAnchor, bottom: safeArea.bottomAnchor, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 125, paddingBottom: -104, paddingLeading: 20, paddingTrailing: -20)
    }
    
    @objc func activateSwitch(sender: UISwitch){
        if sender.isOn {
            UIView.animate(withDuration: 0.2) {
                self.stepperLabel.isHidden = false
                self.splitStepper.isHidden = false
                //                splitBetween = 2
                self.splitStepper.value = 2
                self.stepperLabel.text = "2"
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.stepperLabel.isHidden = true
                self.splitStepper.isHidden = true
                //                splitBetween = 1
            }
        }
    }
    
    
    func setUpView(){
        view.backgroundColor = .background
        self.stepperLabel.isHidden = true
        self.splitStepper.isHidden = true
        self.splitSwitch.addTarget(self, action: #selector(activateSwitch(sender:)), for: .touchUpInside)
    }
    
    // Total Label Constraint
    
    //MARK: - Views
    //MARK: - ViewLevelComponentStackView
    let viewLevelComponentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 40
        return stackView
    }()
    
    //MARK: - Buttons Stack View
    let bottomButtonsComponentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        return stackView
    }()
    
    let resetButton: TipperButton = {
        let button = TipperButton()
        button.setTitle("Reset", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let calculateButton: TipperButton = {
        let button = TipperButton()
        button.setTitle("Calculate", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    //MARK: - Subtotal
    let subtotalLabel: TipperLabel = {
        let label = TipperLabel()
        label.text = "Subtotal"
        label.font = label.font.withSize(18.0)
        return label
    }()
    
    let subtotalText: TipperTextField = {
        let textField = TipperTextField()
        textField.placeholder = "$0.00"
        textField.textAlignment = .center
        textField.addConstraint(NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 34))
        
        return textField
    }()
    
    let subtotalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 100
        return stackView
    }()
    //MARK: - Tip Percent
    
    let tenButton: TipPercentButton = {
        let button = TipPercentButton()
        button.setTitle("10%", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let fifteenButton: TipPercentButton = {
        let button = TipPercentButton()
        button.setTitle("15%", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let twentyButton: TipPercentButton = {
        let button = TipPercentButton()
        button.setTitle("20%", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let percentButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        return stackView
    }()
    
    //MARK: - Tip Label
    
    let tipLabel: TipperLabel = {
        let label = TipperLabel()
        label.text =  "TIP"
        label.font = label.font.withSize(18.0)
        return label
    }()
    
    //MARK: - Tip StackView
    
    let tipStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 100
        return stackView
    }()
    //MARK: - Top Component Stack View
    let topComponentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 30
        return stackView
    }()
    
    //MARK: - Bottom Component Stack View
    let bottomComponentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 40
        return stackView
    }()
    
    //MARK: - Split stack view
    let splitStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let splitLabel: TipperLabel = {
        let label = TipperLabel()
        label.text = "Split?"
        label.font = label.font.withSize(18.0)
        label.textAlignment = .center
        return label
    }()
    
    let splitSwitch: TipperSwitch = {
        let onSwitch = TipperSwitch()
        return onSwitch
    }()
    
    //MARK: - Split stepper View
    
    let splitStepperStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        //        stackView.spacing = 50
        return stackView
    }()
    
    let stepperLabel: TipperLabel = {
        let label = TipperLabel()
        label.text = "0"
        label.font = label.font.withSize(18.0)
        label.textAlignment = .center
        return label
    }()
    
    let splitStepper: TipperStepper = {
        let stepper = TipperStepper()
        stepper.minimumValue = 2
        return stepper
    }()
    
    //MARK: - Total Label
    let totalLabel: TipperLabelBold = {
        let label = TipperLabelBold()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total"
        label.font = label.font.withSize(30.0)
        label.addConstraint(NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 84))
        label.textAlignment = .right
        return label
    }()
}
