# HardhatTemplate
    实现一个ERC20代币合约并完成部署和verify到sepolia网络，除了满足最基本的ERC20标准之外，再增加几个功能：
        1. 支持增发，但每次增发比例不能超过1%，且增发间隔至少需要1年以上；
        2. 只有合约的owner才可以增发；
        3. 支持销毁，用户可以销毁自己的代币，获得授权的也可以销毁被授权者的代币；

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

    FUTURE:
        sepolia: 0xB14648D8c6371Fc187A980B1bc081983C6A6BB1E


VeLOCK, 投票治理代币-非标准ERC20

    用户锁定LOCK，提供数量和锁定时长, 
    我们记录本次锁定的一些固定数据，每次锁定都是分开的独立结构体：
    struct VeLock {
        uint amount; //质押的LOCK数量
        uint originTime; //初始锁定时间
        uint duration; //锁定时长
        uint unlockTime; //解锁时间
        uint originVeLock; //初始的VeLOCK计算结果
    }

    锁定逻辑：最小锁定时间为30天，最大锁定时间为一年。假如一个人锁定一个LOCK 365天，那么他立即得到一个VeLOCK，这个VeLOCK每天会减少初始量的1/365，减少的时间间隔为一天。到期之后可以取出，也可以继续存放，不过过期的LOCK不会有对应的VeLOCK了。


    数据结构：
        一个数组用来储存所有的用户 address[] public users;
        一个mapping用来根据用户的地址查询他所有的锁定 mapping(address => personalVeLock[]) private userLocks;


    内部函数：
        function _isUserExists(address user) internal view returns (bool);
            查询用户是否有LOCK在合约里（包含锁定中+锁定过期未取出的LOCK）
        
        function _calculatePersonalVeLOCK(address user) internal view returns (uint);
            根据个人的LOCK存档计算他当前的的VeLOCK

        function _calculateTotalVeLOCK() internal view returns (uint);
            累加所有人的VeLOCK得到VeLOCK总量

    
    外部函数：
        function addLock(uint amount, uint duration) external;
            为新用户或者老用户锁定一定数量的LOCK

        function withdrawLock(uint index) external;
            为老用户取出锁定完成的LOCK

        function getVotingPower(address user) external view returns (uint power, uint totalPower);
            得到个人VeLOCK和VeLOCK总量，可以用来计算投票权

        function totalSupply() external view returns (uint);
            得到VeLOCK总供应量
        
        function balanceOf(address user) external view returns (uint);
            得到个人的VeLOCk数量

    公共函数:
        name()
        symbol()
        decimals()
        users() -> 根据index查询用户地址
        token() -> LOCK实例地址

    事件: 
        event AddLock(address indexed user, uint amount, uint duration);
        event WithdrawLock(address indexed user, uint amount);



