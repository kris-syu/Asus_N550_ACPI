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


Apr 1, 2015
  
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
      
Oct 29, 2014
  
      +  实现原生电源管理  
      
Oct 28, 2014
  
      +  实现原生电源管理  
      
Oct 26, 2014  
  
      +  修正 DSDT 反编译后的语法错误
      +  修复 BIOS 重置问题  
      

