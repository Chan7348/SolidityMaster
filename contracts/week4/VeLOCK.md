用户锁定LOCK，提供 {amount, time(<= 4 years)}, 我们记录OriginTime, 记录 OriginVeLock， amount(OriginVeLOCK) = amount(LOCK) * time / 4;

同时获得：
    锁定时间： OriginTime,
    锁定时长： duration,
    解锁时间： UnlockTime = OriginTime + duration

struct Lock {
    uint amount; //质押的LOCK数量
    uint originTime; //初始锁定时长
    uint duration; //锁定时长
    uint unlockTime; //解锁时间
    uint originVeLock; //初始的VeLOCK计算结果
}
mapping(address => LOCK[]) public userLocks;

我们实时计算：
    剩余时间： rest = UnlockTime - block.timestamp


根据公式，本次的VeLOCK: amount(VeLOCK) = amount(OriginVeLOCK) * rest / duration

外部函数：
    总： 
        view LOCK锁仓量
         VeLOCK总量

    单独用户：
        view 用户锁定的LOCK总量  
        view 解锁的LOCK数量     
        view 用户当前的VeLOCK   
        view 用户的投票权       
        检查自己有多少质押结束的LOCK并全部提取

内部函数逻辑:
    internal _update 总量更新函数，重新计算totalVeLock {
        每次有新用户质押的时候都要执行_update
        每次有用户查询自己的VeLOCK和投票比重的时候执行_update
        每次查询totalVeLock的时候要执行_update
    }
