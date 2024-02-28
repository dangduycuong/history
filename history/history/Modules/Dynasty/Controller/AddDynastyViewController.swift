//
//  AddDynastyViewController.swift
//  history
//
//  Created by cuongdd on 28/02/2024.
//

import UIKit

class AddDynastyViewController: BaseViewController {
    private lazy var nameTextField: BaseTextField = {
        let textField = BaseTextField()
        textField.placeholder = "Nhập tên nhân vật"
        textField.delegate = self
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1
        textField.clearButtonMode = .whileEditing
        textField.layer.cornerRadius = 4
        return textField
    }()
    
    private lazy var urlTextField: BaseTextField = {
        let textField = BaseTextField()
        textField.placeholder = "Nhập url"
        textField.delegate = self
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1
        textField.clearButtonMode = .whileEditing
        textField.layer.cornerRadius = 4
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    private var viewModel = AddDynastyViewModel()
    
    override func loadView() {
        super.loadView()
        prepareForViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addObserver()
    }
    
    private func prepareForViewController() {
        addBackground()
        addTitle(title: "Thêm Triều đại")
        addBackButton()
        
        view.layout(nameTextField)
            .below(titleLabel, 32)
            .left(16)
            .right(16)
            .height(40)
        
        view.layout(urlTextField)
            .below(nameTextField, 16)
            .left(16)
            .right(16)
            .height(40)
        
        view.layout(saveButton)
            .centerX()
            .below(urlTextField, 32)
            .width(150)
            .height(40)
        
        saveButton.setTitle("Lưu Lại", for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        saveButton.backgroundColor = UIColor.blue
        saveButton.layer.cornerRadius = 4
    }
    
    private func addObserver() {
        viewModel.finishedAddData = {
            self.showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Thông báo", message: "Đã thêm dữ liệu thành công", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tiếp tục", style: .default) { _ in
        })
        
        alert.addAction(UIAlertAction(title: "Trở lại", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        })

        present(alert, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc private func saveButtonClicked(_ sender: UIButton) {
        viewModel.addData()
    }

}

extension AddDynastyViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == nameTextField {
            viewModel.name = nameTextField.text
        }
        if textField == urlTextField {
            viewModel.url = urlTextField.text
        }
        saveButton.isEnabled = viewModel.validateInput()
    }
}
