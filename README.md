## 文档参考地址
> 参考地址: https://aptos.dev/cli-tools/aptos-cli-tool/use-aptos-cli#move-examples
> move原生数据结构API文档 :https://mp.weixin.qq.com/s/epwJmR6oXCgtKtSbBqJyAw
> 教学资料: https://movefuns.atlassian.net/wiki/spaces/MOVEFUNS/pages/491526/Move
> 钱包源码: https://github.com/leeduckgo/punk-wallet
## aptos-cli 安装
> aptos-cli使用参考:https://mp.weixin.qq.com/s/2_0wL1KIAdoxYqya-thi6Q
## 账户初始化
```
 aptos init
```
[图片](./asset/aptos-init.jpg)
## 账户资金初始化
```
$ aptos account fund-with-faucet --account 61f0b0362577500d6c4fb15612ae0fffd39d643ebd53e9d4b32779d47f6ec343
```
或者
```
aptos account fund-with-faucet --account default
```
[图片](./asset/1666755175653.jpg)
## 查看账户的余额和转账
```
aptos account list --query balance --account 61f0b0362577500d6c4fb15612ae0fffd39d643ebd53e9d4b32779d47f6ec343
```
或者
```
aptos account list --query balance --account default
```
[图片](./asset/1666755402234.jpg)
## move合约编写
> 参考文档地址: https://aptos.dev/tutorials/first-move-module
> 资料文档: https://blog.csdn.net/wallywxy/article/details/127056508

1. 创建新的move合约
``` 
mkdir seaCoin 
cd seaCoin
aptos move init --name seaCoin
```
2. 编译并测试
  * 编译
    ```
    cd seaCoin
    aptos move compile --named-addresses sea_coin=default
    ```
  * 测试模块运行
    ```
    aptos move test --named-addresses sea_coin=default
    ```  
3. 验证智能合约：Move Prover 教程
   >参考:https://mp.weixin.qq.com/s/_UWiX5nPGLZpmFQF2GE-mQ
   ```
   TODO 
   ```    
4. 注意事项
  * 依赖包本地化
  > 但是 move-stdlib 需要用 https://github.com/aptos-labs/aptos-core/tree/main/aptos-move/framework 这个里面提取出来的, 不能用 https://github.com/diem/diem/tree/latest/language/move-stdlib, 因为这个缺少 Move.toml
  

## 其他资源
> [dApp 实用开发存储指南之 Gist(存储)](https://mp.weixin.qq.com/s/wGkPsU-T0CHPcTbKiGDzLw)
> [Move 高阶语法](https://mp.weixin.qq.com/s/OXLyiUKzpFzAzc-PVxLvTA) 
