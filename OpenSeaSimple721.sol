// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MoYangNFT is ERC721URIStorage{
    uint public tokenId;

    constructor() ERC721("MoYang","MYNFT"){
            tokenId = 0;
    }

    function createNFTs(string memory tokenURI) public returns(uint){
        uint _tokenId = tokenId;

        _safeMint(msg.sender,_tokenId);
        _setTokenURI(_tokenId,tokenURI);

        tokenId++;

        return _tokenId;
    }

    function burn(uint256 _tokenId) public virtual{
        require(_isApprovedOrOwner(msg.sender,_tokenId),"You are not the owner or not approved");

        super._burn(_tokenId);
    }

}

/*
{
  "attributes": [
    {
      "trait_type": "性格",
      "value": "无"
    },
    {
      "trait_type": "智商",
      "value": "无"
    },
    {
      "trait_type": "颜值",
      "value": "无"
    },
    {
      "trait_type": "爱好",
      "value": "无"
    },
    {
      "trait_type": "发型",
      "value": "无"
    },
    {
      "trait_type": "youtu等级",
      "value": "无"
    },
    {
      "trait_type": "靠谱值",
      "value": "无"
    },
    {
      "display_type": "date",
      "trait_type": "生日",
      "value": 1642909628
    },
    {
      "display_type": "boost_number",
      "trait_type": "努力值",
      "value": 10,
      "max_value": 100
    },
    {
      "display_type": "boost_percentage",
      "trait_type": "幸运值",
      "value": 100
    }
  ],
  "description": "这只是一个普通的NFT",
  "external_url": "https://baidu.com",
  "image": "https://...",
  "name": "Simple MoYangNFT"
}
*/