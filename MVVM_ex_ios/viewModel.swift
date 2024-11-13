//
//  viewModel.swift
//  MVVM_ex_ios
//
//  Created by 김석준 on 11/13/24.
//

import Foundation

class UserViewModel {
    // 뷰에서 사용자 이름을 표시하기 위한 변수를 옵셔널 클로저로 정의
    var onUserNameChanged: ((String) -> Void)?
    
    private var user: User? {
        didSet {
            // 사용자 정보가 변경되면 클로저를 호출하여 뷰를 업데이트
            if let name = user?.name {
                onUserNameChanged?(name)
            }
        }
    }
    
    func fetchUser() {
        // 실제 앱에서는 네트워크 요청이 들어가겠지만, 예시로 간단히 데이터를 설정
        self.user = User(id: 1, name: "John Doe")
    }
}
