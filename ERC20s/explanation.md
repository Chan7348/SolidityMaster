WETH: 除了ERC20基础标准，
    通过payable deposit进去的ETH会直接增加账户WETH余额，withdraw同理
    totalSupply() 直接返回合约账户ETH余额

UNI: 实现ERC20基础标准
    struct Checkpoint + mapping checkpoints + mapping numCheckpoints 记录投票检查点
    实现EIP712，EIP2612，Permit函数用来离线签名approve
    delegate

