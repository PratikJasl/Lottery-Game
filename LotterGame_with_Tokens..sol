// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract LotteryApplication
{
    address public manager;
    address payable [] public participants;
    address public LotteryWinner;
    uint public _TotalTokens;
    uint8 decimal;
    string public _TokenName;
    string public _TokenSymbol;
    uint public TokenPrice;
    mapping(address => uint)TokenBalance;
   
    
    constructor(string memory TokenName, string memory Tokensymbol)
    {
        manager = msg.sender;
        _TotalTokens = 1000;
        _TokenName = TokenName;
        _TokenSymbol = Tokensymbol;
        decimal = 18;
        TokenPrice = 100 wei;
    }

    //This receive function will only receive ether when the require condition is satisfied.
    //Then it will store the address of whoever sends ether to this contract in the array participants.
    receive() external payable   
    {
        require(msg.value == 100 wei, "Ticket Cost is 1 ether");
        participants.push(payable(msg.sender)); 
        TokenBalance[msg.sender] += 1 ;
        _TotalTokens -= 1;
    }

    //This fucntion will only allow the manager to check balance of the contract.
    function CheckBalance() public view returns(uint)
    {
        require(msg.sender == manager, "!!! You are not authorized");
        return address(this).balance;
    }

    //This function allows the users to check their token balance.
    function CheckTokenBalance(address _account) public view returns(uint)
    {
        uint balanceofToken;
        balanceofToken = TokenBalance[_account];
        return balanceofToken;
        
    }

    // This function generates a random interger number which is then used to select the winner.
    function random() public view returns (uint)
    {
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length)));
    }

    //This function is used to select a winner. It uses the modulo operator to generate the index of the winner.
    //All the funds of the contract are then send to this winner address.
    //Once the funds have been sent to the winner the lottery will reset making the participants array empty.
    function SelectWinner() public
    {
        require(msg.sender == manager, "!!! Access Denied, You are not the Manager");
        require(participants.length >= 3, "!!! Aborting, not enough participans");
        uint r = random();
        uint index = r % participants.length;
        address payable winner;
        winner = participants[index];
        winner.transfer(CheckBalance());
        LotteryWinner = winner;
    }
    function Reset_tokens() public returns(bool)
    {
        require(msg.sender == manager, "Aborting, you are not the manager");
        require(participants.length >= 0,"Aborting!!! no participants yet");
        uint length = participants.length;
        uint i;
        for(i = 0; i < length; i++)
        {
            TokenBalance[participants[i]] = 0;
        }
        participants = new address payable[](0);
       _TotalTokens = 1000;
       return(true);
    }

}

