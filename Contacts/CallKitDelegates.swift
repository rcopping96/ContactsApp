//
//  CallKitDelegates.swift
//  Contacts
//
//  Created by Rob Copping on 09/08/2021.
//

import Foundation
import CallKit
import AVFoundation

class ProviderDelegate: NSObject, CXProviderDelegate {
    
    // Constants
    
    private let callManager: CallManager
    private let provider: CXProvider
    
    init(callManager: CallManager) {
        self.callManager = callManager
        
        provider = CXProvider(configuration: ProviderDelegate.providerConfiguration)
        
        super.init()
            
        provider.setDelegate(self, queue: nil)
    }
    
    static var providerConfiguration: CXProviderConfiguration = {
        let providerConfiguration = CXProviderConfiguration()
        
      providerConfiguration.supportsVideo = false
      providerConfiguration.maximumCallsPerCallGroup = 1
      providerConfiguration.supportedHandleTypes = [.phoneNumber]
      
      return providerConfiguration
    }()
    
    //Incoming Call
    
    func reportIncomingCall(
      uuid: UUID,
      handle: String,
      completion: ((Error?) -> Void)?
    ) {
      let update = CXCallUpdate()
      update.remoteHandle = CXHandle(type: .phoneNumber, value: handle)
      
      provider.reportNewIncomingCall(with: uuid, update: update) { error in
        if error == nil {
          let call = Call(uuid: uuid, handle: handle)
          self.callManager.add(call: call)
        }
        
        completion?(error)
      }
    }
    
    func providerDidReset(_ provider: CXProvider) {
        stopAudio()
        
        callManager.removeAllCalls()
    }
}

