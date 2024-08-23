// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20{
    address public gameOwner;
    mapping (address => uint) public playerSkin;

    constructor() ERC20("Degen", "DGN") {
        gameOwner= msg.sender;  
    }

    modifier onlyOwner {
        require(msg.sender==gameOwner, "only owner of the game allowed");
        _;
    }

    modifier checkTokens(uint256 _amount) {
        require(balanceOf(msg.sender) >= _amount, "DGN balance not enough to transfer");
        _;
    }

    function mint(address _player, uint256 _amount) public onlyOwner  {
        _mint(_player, _amount);
    }

    function burn(uint256 amount) public checkTokens(amount) {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override checkTokens(amount)  returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

     function balance(address _owner) public view returns (uint256) {
        return super.balanceOf(_owner);
    }

    function store() external pure returns (string memory) {
        return "Skin: 1. Monk, 2. Miltary, 3. Knight, 4. Ninja ";
    }

    function redeem(uint8 _Item) external payable returns (bool) {
        if (_Item == 1) {
            require(this.balanceOf(msg.sender) >= 100, "DGN balance not enough");
            approve(msg.sender, 100);
            transferFrom(msg.sender, gameOwner, 100);
            playerSkin[msg.sender] = 1;
            return true;
        }
        else if (_Item == 2) {
            require(this.balanceOf(msg.sender) >= 50, "DGN balance not enough");
            approve(msg.sender, 15);
            transferFrom(msg.sender, gameOwner, 50);
            playerSkin[msg.sender] = 2;
            return true;
        }
        else if (_Item == 3) {
            require(this.balanceOf(msg.sender) >= 25, "DGN balance not enough");
            approve(msg.sender, 25);
            transferFrom(msg.sender, gameOwner, 25);
            playerSkin[msg.sender] = 3;
            return true;
        }
        else if (_Item == 4) {
            require(this.balanceOf(msg.sender) >= 15, "DGN balance not enough");
            approve(msg.sender, 15);
            transferFrom(msg.sender, gameOwner, 15);
            playerSkin[msg.sender] = 3;
            return true;
        }
        else {
            return false;
        }
    }
}