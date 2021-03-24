pragma solidity ^0.5.16;

contract SiomaiToken {
    mapping(address => uint) public balances;
    mapping(address => mapping(address=>uint)) public allowance;
    uint public totalSupply = 1000 * 10 ** 18;
    string public name = "SIOMAI Token";
    string public symbol = "SIOMAI";
    uint public decimals = 18;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approve(address indexed owner, address indexed spender, uint value);

    constructor() public {
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address owner) public view returns(uint) {
        return balances[owner];
    }

    function transfer(address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, 'balance too low');
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(address from, address to, uint value) public returns(bool) {
        require(balanceOf(from) >= value, 'balance too low');
        require(allowance[from][msg.sender] >= value, 'allowance to low');
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
    }

    function approve(address spender, uint value) public returns(bool) {
        allowance[msg.sender][spender] = value;
        emit Approve(msg.sender, spender, value);
        return true;
    }
}