//
//  StoriesViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

class StoriesViewController: BaseViewController {
    private lazy var searchView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.placeholder = "Nhập tên điển cố"
        return textField
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.keyboardDismissMode = .onDrag
        tableView.backgroundColor = UIColor.clear
        tableView.register(with: StoryTableViewCell.self)
        
        return tableView
    }()
    
    private var viewModel = StoriesViewModel()
    
    override func loadView() {
        super.loadView()
        prepareForViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addObserver()
        viewModel.readJSONFile(forName: "Stories")
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
        addTitle(title: "Điển Tích - Điển Cố")
        view.layout(searchView)
            .below(titleLabel, 16)
            .left(16)
            .right(16)
            .height(40)
        
        searchView.layer.cornerRadius = 8
        searchView.layer.shadowColor = UIColor.black.cgColor
        searchView.layer.shadowOpacity = 0.5
        searchView.layer.shadowOffset = .zero
        searchView.layer.shadowRadius = 8
        searchView.backgroundColor = UIColor.white
        
        searchView.layout(searchImageView)
            .centerY()
            .left(8)
            .width(24)
            .height(24)
        
        searchImageView.image = R.image.icons8Search()
        
        searchView.layout(searchTextField)
            .top(4)
            .left(40)
            .bottom(4)
            .right(4)
        
        view.layout(tableView)
            .below(searchView, 16)
            .left()
            .bottomSafe()
            .right()
    }
    
    private func addObserver() {
        viewModel.storiesDataSource.skip(1).observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] list in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
}

extension StoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.storiesDataSource.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellType: StoryTableViewCell.self, forIndexPath: indexPath)
        let model = viewModel.storiesDataSource.value[indexPath.row]
        cell.configure(index: indexPath.row, title: model.title, description: model.content, searchText: viewModel.searchText, isSelecting: model.isShowing)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showingDetail(at: indexPath.row)
        let vc = StoryDetailViewController()
        vc.contentModel = viewModel.storiesDataSource.value[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension StoriesViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        viewModel.searchText = searchTextField.text
    }
}
