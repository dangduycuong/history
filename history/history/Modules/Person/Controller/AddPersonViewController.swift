//
//  AddPersonViewController.swift
//  history
//
//  Created by cuongdd on 28/02/2024.
//

import UIKit

class AddPersonViewController: BaseViewController {
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
    
    private lazy var dateTextField: BaseTextField = {
        let textField = BaseTextField()
        textField.delegate = self
        textField.font = UIFont.systemFont(ofSize: 21)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "Chọn thời gian"
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        return datePicker
    }()
    
    private var viewModel = AddPersonViewModel()
    
    override func loadView() {
        super.loadView()
        prepareForViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addObserver()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private func prepareForViewController() {
        addBackground()
        addTitle(title: "Nhân vật lịch sử")
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
        
        view.layout(dateTextField)
            .below(urlTextField, 16)
            .left(16)
            .right(16)
            .height(40)
        
        view.layout(saveButton)
            .centerX()
            .below(dateTextField, 32)
            .width(150)
            .height(40)
        
        saveButton.setTitle("Lưu Lại", for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        saveButton.backgroundColor = UIColor.blue
        saveButton.layer.cornerRadius = 4
        
        setupDatePicker()
    }
    
    private func setupDatePicker() {
        datePicker.backgroundColor = .white
        datePicker.isHidden = true
        datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        let datePickerView = UIDatePicker()
        datePickerView.preferredDatePickerStyle = .inline
        datePickerView.datePickerMode = .date
        datePickerView.locale = Locale(identifier: "vi_VN")
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        
        dateTextField.inputView = datePickerView
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
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, HH:mm:ss d MMMM, yyyy"
        dateFormatter.locale = Locale(identifier: "vi_VN")
        dateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc private func saveButtonClicked(_ sender: UIButton) {
        viewModel.addData()
    }
}

extension AddPersonViewController: UITextFieldDelegate {
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
