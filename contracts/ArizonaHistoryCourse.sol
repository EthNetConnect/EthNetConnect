pragma solidity ^0.4.18;

contract ArizonaHistoryCourse {
    string private courseName;
    string private courseFinalExamQuestion;
    string private lesson;
    bytes32 private examAnswerCommitment;
    uint private courseCredits;

    mapping(address => uint) userProgress;

    constructor(string name, string content, string finalExamQuestion, bytes32 answerCommitment, uint credits) {
        courseName = name;
        lesson = content;
        courseFinalExamQuestion = finalExamQuestion;
        examAnswerCommitment = answerCommitment;
        courseCredits = credits;
    }

    function enroll() public payable {
        if (userProgress[msg.sender] != 4) {
            require(msg.value == courseCredits);
        }
        userProgress[msg.sender] = 1;
    }

    modifier onlyLevel(uint level) {
        require(userProgress[msg.sender] == level);
        _;
    }

    function getLesson() public view onlyLevel(1) returns (string) {
        return lesson;
    }

    function getExamQuestion() public view onlyLevel(1) returns (string) {
        return courseFinalExamQuestion;
    }

    function submit(string answerPreimage) public {
        if (keccak256(abi.encodePacked(answerPreimage)) == examAnswerCommitment) {
            userProgress[msg.sender] = 2;
        }
        else {
            userProgress[msg.sender] = 4;
        }
    }

    function getCertificate() public onlyLevel(2) {
        userProgress[msg.sender] = 0;
        msg.sender.transfer(courseCredits);
    }
}
