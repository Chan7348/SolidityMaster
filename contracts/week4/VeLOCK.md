用户锁定LOCK，提供 {amount, time(<= 365 days)}, 我们记录OriginTime, 记录 OriginVeLock， amount(OriginVeLOCK) = amount(LOCK) * time / 365;

最大锁定时间为一年
假如一个人锁定一个LOCK 365天，那么他立即得到一个VeLOCK，这个VeLOCK每天会减少初始量的1/365
先要设计出一份VeLOCK的损耗逻辑和实现方式

维护两个mapping，一个可以通过地址获得Lock，另一个可以通过序列号获得Lock
每次更新当前用户的VeLOCK时都要更新VeLOCK总量

depoist(uint number, uint duration) {

}

calculate() {

}


VeLOCK需要随时计算，因为每天都会产生变化
同时获得：
    锁定时间： OriginTime,
    锁定时长： duration,
    解锁时间： UnlockTime = OriginTime + duration

struct VeLock {
    uint amount; //质押的LOCK数量
    uint originTime; //初始锁定时间
    uint duration; //锁定时长
    uint unlockTime; //解锁时间
    uint originVeLock; //初始的VeLOCK计算结果
}
mapping(address => VeLOCK[]) public userLocks;

我们实时计算：
    剩余时间： rest = UnlockTime - block.timestamp


根据公式，本次的VeLOCK: amount(VeLOCK) = amount(OriginVeLOCK) * rest / duration

外部函数：
    总： 
        view LOCK锁仓量 getTotalLOCKstaked()
        VeLOCK总量

    单独用户：
        checkLOCK() 调用_checkSingle返回结果  
        getVoteRight() 用户的投票权       
        withdraw() 取出所有解锁的LOCK

内部函数逻辑:
    _deposit() 迭代此用户的VeLOCK数量和总的VeLOCK数量 {
        质押
        每次有用户查询自己的VeLOCK和投票比重的时候执行_update
        每次查询totalVeLock的时候要执行_update
    }
    _update() 在_deposit()内部需要执行，计算当前时间点的VeLOCK
    _checkSingle 检查和更新单独用户的锁仓量和解锁量

每次用户查询的时候才更新 VeLOCK的量