//
//  StoriesViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

class StoriesViewController: BaseViewController {
    
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
        view.layout(searchTextField)
            .below(titleLabel, 16)
            .left(16)
            .right(16)
            .height(40)
        
        searchTextField.delegate = self
        searchTextField.placeholder = "Nhập tên điển cố"
        
        view.layout(tableView)
            .below(searchTextField, 16)
            .left()
            .bottomSafe()
            .right()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(with: StoryTableViewCell.self)
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
