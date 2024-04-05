# HardhatTemplate
Week1: 
    实现一个ERC20代币合约并完成部署和verify到sepolia网络，除了满足最基本的ERC20标准之外，再增加几个要求：
        1. 支持增发，但每次增发比例不能超过1%，且增发间隔至少需要1年以上；
        2. 只有合约的owner才可以增发；
        3. 支持销毁，用户可以销毁自己的代币，获得授权的也可以销毁被授权者的代币；
        4. 部署要remix和hardhat两种方式都熟悉；
        5. verify要用remix和hardhat，以及直接在区块链浏览器上都能verify

分析了一下openzeppelin的ERC20代码库，基本实现逻辑是这样：
    ERC20文件夹下分为
        ERC20.sol 
        IERC20.sol 
        /extensions 
        /utils 
    四个项目
        IERC20 这个接口包含了EIP20所规定的所有必须实现的函数
        /utils 只包含了一个 SafeERC20.sol 文件，实现了一个库，用来帮助我们的token进行一些安全操作，比如安全转移
        /extensions 包含了各种类型token的具体实现以及两个接口，一个是metadata包含了几个可选函数，另一个是Permit，包含了permit功能的基础定义

基本上
    