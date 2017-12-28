import UIKit

class TableViewModel {

    let queue = DispatchQueue(label: "com.jonbott.LearningThreadSanitizer.loading", qos: .background, attributes: .concurrent, target: .none)
    
    let dataLayer = DataLayer<RowType>()
    
    let readablePasswords = ["SpINiTaNtOUs", "RtHerseNdGaV", "tIconACETyPt", "tIconACETyPt", "antrIbIBuLAN", "cAEliComOnag"]
    let obscurePasswords  = ["sg9Z382H^Z4J", "7803Q4Wc%fT1", "d2604PHwj6e@", "@2SQ6*X3931w", "0!#oBX3u1370", "962i5X8n7%5q"]
}

extension TableViewModel {

//MARK: - single thread loadData - slow
    func loadData(finished: @escaping ()->Void) {
        let group = DispatchGroup()
        
        for word in readablePasswords {
            queue.async(group: group, qos: .background, flags: DispatchWorkItemFlags()) {
                let rowType = Helper.rowType(for: word)
                self.dataLayer.append(rowType)
            }
        }
        
        for number in obscurePasswords {
            queue.async(group: group, qos: .background, flags: DispatchWorkItemFlags()) {
                let rowType = Helper.rowType(for: number, isObscure: true)
                self.dataLayer.append(rowType)
            }
        }
        
        group.notify(queue: .main) {
            finished()
        }
    }    
}

//MARK: - passthrough methods
extension TableViewModel {
    var numberOfItems: Int {
        return dataLayer.count
    }
    
    func rowType(at index: Int) -> RowType {
        return dataLayer.rowTypeAt(index)
    }
}
