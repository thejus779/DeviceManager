# DeviceManager

Welcome to DeviceManager app, a basic app which loads some mocked devices asynchronously, let's the user search for devices and display details about the device.

## Pre-requirements

1. Minimun deployment target iOS 14

## Libraries used

### Swift package manger
1. SDWebImage -> https://github.com/SDWebImage/SDWebImage -> Only used for managing cached images, as the mocked image urls are loaded from network.
2. TLogger -> https://github.com/thejus779/TLogger -> My personal logger with emojis to make life easy


## Architecure

1. DeviceManager uses MVVM + coordinator architecure where all data is handled at Model leve, View models respective to each view, and Controllers as Views.
2. All routings and flows are handled by respective Coordinators.
3. Uses local pagination on fetched devices results.
 [ Have implemented a local pagination on fetched data to load only a fixed number of data, and append more as we scroll to the bottom of grid. For demonstrative purposes, it is only done on Home, can be implemented on searched data as well ]

## Limitations

1. External SDK `SDWebImage` is used for loading image async, if given more time this can be handled locally with help of cache on device.


## Known Issues to improve in V2

1. To introduce a cache for the network calls if any.
2. Implement a side menu.
3. Better UI with some good assests and images.


## Usage

###  DeviceService -> Protocol for service (DeviceNetworkService and MockedDeviceService implements this)

    ```func searchDevice(with query: String, completion: @escaping ResultCallback<[Device]>)```
    Makes an async call to fetch all devices matching the query, can throw erros of type DeviceError.
    
    ```func getAllDevices(completion: @escaping ResultCallback<[Device]>)```
    Makes an async call to fetch all devices, can throw erros of type DeviceError.
    
    ```func cancelAnyOngoingRequest()```
    Cancel any ongoing network request.
    
    ```func loadMockedDevices() -> [Device]```
    returns array of mocked devices loaded from a json file `device_list.json`
        
### HomeViewModel
    ViewModel for the HomeViewController
    ```func getAllDevices(completion: @escaping ResultCallback<[Device]>)```
    ViewModel interacts with the service to fetch all devices matching the query, can throw erros of type DeviceError.
    ```func loadMoreDisplayableDevices(completion: @escaping (Bool) -> Void)```
    ViewModel does a local pagination on the data to load only the needed data and loads more as we scroll down to bottom of table
    
### SearchDevicesViewModel
    ViewModel for the SearchDevicesViewController

    ```func searchDevices(with query: String, completion: @escaping ResultCallback<[Device]>)```
    ViewModel interacts with the service to fetch all devices matching the query, can throw erros of type DeviceError.
    
    ```func reset()```
    ViewModel resets previous search result
    
### DeviceDetailsViewModel
    ViewModel for the DeviceDetailsViewController that handles the view according to the device data.
    
    ```func constructDisplayableInfo(for device: Device) -> [DeviceInfo]```
    Constructs an array of displayable device info from the Device object.
    
### DeviceCellViewModel
    ViewModel for DeviceTableViewCell that handles the cell view according to the device data.
    
## Protocols
    
### Spawnable
    Helps in easy instantiating View controllers from storyboard using `storyboardName` and `storyboardIdentifier`
### CellRegistration
    Helps in easy registration of cells
    
### AppCoordinator
    Handles all routing/navigations at AppDelegate level
### HomeCoordinator
    Handles all routing/navigations and flow at Home, Search and Details level

    

## Tests

### UITests
Performs basic UI flow tests, loading all devices, selection a device, searching for device and finally expecting to see the device details.

### Unit Tests
Performs unit tests on small modules
### Integration Tests
Performs integration tests on all unit tests combined.

## Utils
###JsonLoader

    ```func loadResourceJson<T>(filename: String, to type: T.Type, decoder: JSONDecoder = JSONDecoder()) throws -> T where T : Decodable```
    Loads json data and parses them to Decodable from file


## Resources
###`ddevice_list.json`
    Json format file containing some dummy data used for mocking the devices asynch.
