ASUS N550JV ACPI PATCH PROJECT
==============================
    

###  机器详情：

    型号 : 华硕N550X47JV（8GB/1TB）  
    BIOS 版本号 : 208  
    芯片组 : Intel HM86  
    CPU : Intel 酷睿i7 4700HQ  
    显卡 : NVIDIA GeForce GT 750M ＋ Intel GMA HD 4600  
    网卡 : RTL8168 + BCM943225HMB  
    内存 : 8G  
    分辨率 : 1920*1080  
  
  
###  使用方法

>1.  拷贝 /Patched/*.aml 至 /Volumes/EFI/EFI/CLOVER/ACPI/patched/  

>2.  编辑 /Volumes/EFI/EFI/CLOVER/config.plist  
     修改 /ACPI/DSDT/Name 的值为 DSDT.aml  
  
  
###  进度


Apr 11, 2015
  
      +  重写了 _Q0E 和 _Q0F 方法使得 Fn + F5/F6 键可用，64级亮度调节
        （F14/F15 是 17 级）

Apr 9, 2015
  
      +  修改 LPCB 内建方法中的 ID 为0x9c43 以驱动 AppleLPC
      +  重写 SSDT-2，驱动 X86PlatformPlugin 以及 X86PlatformShim 
         以实现 10.10 原生电源管理，系统偏好设置 > 节能器设置中，电池选项卡
         将增加 1 个可设置项，电源选项卡则增加 2 个

Apr 7, 2015
  
      +  内建核心显卡：解决10.10后不支持移动版 HD4600 核显的问题：
         0x04168086 -> 0x04128086
      +  因修改了显卡设备 ID，图形卡识别为 Intel Iris Pro 1024 MB
      +  修改 LPCB 内建方法中的 ID 为0x9c43 以驱动 AppleLPC

Apr 5, 2015
  
      +  内建 BCM943225HMB 无线网卡
      +  解决蓝牙无法关闭的 BUG
      
Mar 10, 2015
  
      +  修正 LPCB 内建方法的设备 ID 为 0x8c49
      
Nov 20, 2014
  
      +  实现 USB 内建
      
Nov 4, 2014
  
      +  解决睡眠唤醒后键盘灯无法调节的问题
      
Nov 3, 2014
  
      +  删除有问题的 BCM943225HMB 无线网卡内建代码
      +  点亮键盘背光灯
      
Oct 30, 2014
  
      +  屏蔽独立显卡，机器温度降低 10℃ 左右
      +  修复电量无法显示的问题
      +  内建有线网卡
      +  内建 BCM943225HMB 无线网卡
      +  实现原生 17 档屏幕背光调节
      
Oct 28, 2014
  
      +  实现 10.9 原生电源管理  
      
Oct 26, 2014  
  
      +  修正 DSDT 反编译后的语法错误
      +  修复 BIOS 重置问题  
      

