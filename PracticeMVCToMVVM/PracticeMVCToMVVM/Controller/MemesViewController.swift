//
//  MemesViewController.swift
//  PracticeMVCToMVVM
//
//  Created by Hitesh on 10/05/22.
//

import UIKit

final class MemesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private (set) var meams:[Meme] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        getMemes()
    }
    
    private func setupUI() {
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        
        let bundle = Bundle(for: MemesViewController.self)
        let nib = UINib(nibName: String(describing: MemeTVCell.self), bundle: bundle)
        tableView.register(nib, forCellReuseIdentifier: MemeTVCell.identifier)
    }
    
    func getMemes() {
        APIManager.shared.getMemes { [weak self] result in
            guard let self = self else { return }
            guard let model = try? result.get() else { return }
            self.meams = model.data.memes
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension MemesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemeTVCell.identifier) as! MemeTVCell
        cell.titleLabel.text = meams[indexPath.row].name
        return cell
    }
}
