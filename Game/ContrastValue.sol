pragma solidity ^0.8.4;

// 游戏规则
// 两方比金额大小
// 赢方拿走对方的余额
// 假如相等，则A方win

contract Game1{

    address God;

    uint256 valueA;
    uint256 valueB;

    address playerA;
    address playerB;

    constructor(){
        God = msg.sender;
    }
    function getGod()public view returns(address){
        return God;
    }

    // 压注
    function offer()public payable returns(uint,uint,address){
        require(msg.value > 0,"Money Need gt 0");
        require(playerB == address(0),"Already Two People Here");

        uint winer = 0;

        if (playerA == address(0)){
            playerA = msg.sender;
            valueA = msg.value;

            return (winer,msg.value,msg.sender);
        }

        // 已有一个玩家A，新加的作为B
        playerB = msg.sender;
        valueB = msg.value;

        // 进行比价
        if (valueA >= valueB){ // A方赢
            payable(playerA).transfer(valueA+valueB);
            winer = 1;
        }else{
            payable(playerB).transfer(valueA+valueB);
            winer = 2;
        }

        // 将数值置零
        playerA = address(0);
        playerB = address(0);

        valueA = 0;
        valueB = 0;

       return (winer,msg.value,msg.sender);
    }

    modifier onlyGod(){
        require(msg.sender == God,"You don't has Auth");
        _;
    }

    function queryBalance() public view onlyGod returns(uint) {
        return address(this).balance;
    }

    // 获取参赛人员的地址
    function getPlayers()public view returns(address,address){
        return (playerA,playerB);
    }


}
