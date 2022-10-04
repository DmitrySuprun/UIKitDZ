//
//  CashUPViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 4.10.22.
//

import UIKit

/// Balance Info
final class CashUPViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var totalBalanceLabel: UILabel!
    @IBOutlet private weak var adidasPriceLabel: UILabel!
    @IBOutlet private weak var nikePriceLabel: UILabel!
    @IBOutlet private weak var newBalancePriceLabel: UILabel!
    
    @IBOutlet private weak var adidasStockCount: UITextField!
    @IBOutlet private weak var nikeStockCount: UITextField!
    @IBOutlet private weak var newBalanceStockCount: UITextField!
    @IBOutlet private weak var totalStocksLabel: UILabel!
    
    // MARK: - Private Properties
    private var userStocks: [Stock] = []
    private var marketStocks: [Stock] = []
    
    private lazy var adidasStockCountPickerView = {
        let picker = UIPickerView()
        picker.tag = 0
        return picker
    }()
    
    private lazy var nikeStockCountPickerView = {
        let picker = UIPickerView()
        picker.tag = 1
        return picker
    }()
    
    private lazy var newBalanceStockCountPickerView = {
        let picker = UIPickerView()
        picker.tag = 2
        return picker
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        userStocks = loadUserStocks()
        updateUI()
        setupStockCountPickerView()
        setupTextFields()
    }
    
    // MARK: - IBAction
    @IBAction func sellBuySegmentControl(_ sender: Any) {
    }
    
    @IBAction func currencySwitchAction(_ sender: Any) {
    }
    
    // MARK: - Objc Private Methods
    @objc private func checkCurrentRowAction(_ sender: UILabel) {
        adidasStockCountPickerView.selectRow(Int(sender.text ?? "") ?? 0, inComponent: 0, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupTextFields() {
        adidasStockCount.inputView = adidasStockCountPickerView
        adidasStockCount.addTarget(self, action: #selector(checkCurrentRowAction(_:)), for: .touchUpInside)
        nikeStockCount.inputView = nikeStockCountPickerView
        newBalanceStockCount.inputView = newBalanceStockCountPickerView
    }
    
    private func updateUI() {
        totalBalanceLabel.text = String(userStocks.reduce(0, { partialResult, stock in
            partialResult + stock.count * stock.price
        }))
        adidasPriceLabel.text = String(userStocks.first(where: { $0.name == "Adidas" })?.price ?? 0)
        adidasStockCount.text = String(userStocks.first(where: { $0.name == "Adidas" })?.count ?? 0)

        nikePriceLabel.text = String(userStocks.first(where: { $0.name == "Nike" })?.price ?? 0)
        nikeStockCount.text = String(userStocks.first(where: { $0.name == "Nike" })?.count ?? 0)
        
        newBalancePriceLabel.text = String(userStocks.first(where: { $0.name == "NewBalance"})?.price ?? 0)
        newBalanceStockCount.text = String(userStocks.first(where: { $0.name == "NewBalance"})?.count ?? 0)
        
        totalStocksLabel.text = String(userStocks.reduce(0, { $0 + $1.count }))
    }
    
    private func setupStockCountPickerView() {
        adidasStockCountPickerView.delegate = self
        adidasStockCountPickerView.dataSource = self
    }
    
    private func loadUserStocks() -> [Stock] {
        let stocks = [Stock(name: "Adidas", count: 150, price: 23),
                      Stock(name: "Nike", count: 320, price: 45),
                      Stock(name: "NewBalance", count: 784, price: 27)
        ]
        return stocks
    }
    
    private func loadMarketStocks() -> [Stock] {
        let stocks = [Stock(name: "Adidas", count: 50, price: 23),
                      Stock(name: "Nike", count: 75, price: 45),
                      Stock(name: "NewBalance", count: 44, price: 27)
        ]
        return stocks
    }
}

// MARK: - UIPickerViewDelegate
extension CashUPViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            adidasStockCount.text = "\(row)"
            adidasStockCount.resignFirstResponder()
        case 1:
            nikeStockCount.text = "\(row)"
            nikeStockCount.resignFirstResponder()
        case 2:
            newBalanceStockCount.text = "\(row)"
            newBalanceStockCount.resignFirstResponder()
        default: break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(row)"
    }
}

// MARK: - UIPickerViewDataSource
extension CashUPViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0: return Int(adidasStockCount.text ?? "") ?? 0
        case 1: return Int(nikeStockCount.text ?? "") ?? 0
        case 2: return Int(newBalanceStockCount.text ?? "") ?? 0
        default: return 1
        }
    }
}
