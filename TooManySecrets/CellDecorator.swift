import UIKit

class CellDecorator {
    
    func decorate(_ cell: CustomCell, _ rowType: RowType) {
        NetworkLayer.shared.getSomeData { [weak self] in
            self?.setupLabel(for: cell, rowType: rowType)
            self?.setupImage(for: cell, rowType: rowType)
        }
    }
    
    private func setupLabel(for cell: CustomCell, rowType: RowType) {
        cell.setPassword(password: rowType.string)
    }
    
    private func setupImage(for cell: CustomCell, rowType: RowType) {
        cell.add(image: rowType.image)
    }
}
