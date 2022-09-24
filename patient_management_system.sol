// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract PatientManagementSystem{
    address owner;
    constructor() {
         owner = msg.sender;
    }

    struct patientInfo{
        string name;
        uint phoneNumber;
        string disease;
        string test;
        bool patientAdded;
    }

    mapping(address => patientInfo) allPatients;

    function addPatient(address patientAddress, string memory name, uint phoneNumber, string memory disease, string memory test) public returns(string memory){
        require(msg.sender == owner, "Only owner can add a patient");
        require(!allPatients[patientAddress].patientAdded, "Patient already added");
        allPatients[patientAddress] = patientInfo(name, phoneNumber, disease, test, true);
        return "Patient added successfully";
    }

    function updatePatient(address patientAddress, string memory name, uint phoneNumber, string memory disease, string memory test) public returns(string memory){
        require(msg.sender == owner, "Only owner can update a patient");
        allPatients[patientAddress] = patientInfo(name, phoneNumber, disease, test, true);
        return "Patient updated successfully";
    }

    function getPatientInfo(address patientAddress) public view returns(patientInfo memory){
            require(msg.sender == owner, "Only owner can get patient info");
            require(allPatients[patientAddress].patientAdded, "Patient not exists");
            return allPatients[patientAddress];
    }

    function getMyDetails() public view returns(patientInfo memory){
        require(allPatients[msg.sender].patientAdded, "Patient not exists");
        return allPatients[msg.sender];
    }
    
}