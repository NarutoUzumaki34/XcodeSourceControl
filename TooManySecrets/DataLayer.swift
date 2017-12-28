import Foundation

class DataLayer<T> {
    var data = [T]()
    
    //Queues by default are serial - FIFO
    private let queue = DispatchQueue(label: "com.jonbott.LearningThreadSanitizer.DataLayerQueue")
    
    
    func rowTypeAt(_ index: Int) -> T {
        return queue.sync {
            return data[index]
        }
    }
    
    func append(_ data: T) {
        queue.async {
            self.data = self.data + [data]
        }
    }
    
    var count: Int {
        return queue.sync {
            return data.count
        }
    }
}
