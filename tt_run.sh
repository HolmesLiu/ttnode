#确认是否挂载硬盘
sleep 1s;
read -p "
执行安装命令前请先确认是否创建/mnts文件夹以及挂载硬盘:

1.已经创建/mnts文件夹以及挂载硬盘请输入1（默认）

2.退出，以及查看如何创建/mnts文件夹、挂载硬盘，请输入2

请输入数字1或2（默认为1）：" mountstore
if [[ ${mountstore} == 1 || ${mountstore} == '' ]];then
sleep 1s
else
echo "

创建/mnts文件夹命令：mkdir /mnts

挂载命令：mount /dev/sda1 /mnts ;注意此处的sda1要根据实际的磁盘分区名称挂载，通过命令：lsblk 查看u盘或硬盘的磁盘分区名称（通过容量大小来确认）

";
sleep 2s;
exit 0
fi

#选择安装甜糖的arm版本
choose='ture';
while [ $choose == 'ture' ] ;do
read -p "
请输入要安装的arm版：

1.n1、我家云、r3300l等64位盒子请输入1（默认）

2.玩客云等32位盒子请输入2

请输入数字1或2（默认为1）：" armtype
if [[ ${armtype} == 1 || ${armtype} == '' ]];then
choose='false';
mv ./ttnode-arm/node /usr/;
mv ./ttnode-arm/arm64/ttnode /usr/node;
elif [[ ${armtype} == 2 ]];then
choose='false';
mv ./ttnode-arm/node /usr/;
mv ./ttnode-arm/arm32/ttnode /usr/node;
else
echo "

输入错误，5s后请重新选择，或按ctrl+c退出安装命令
";
sleep 5s;
fi
done

#安装qrencode扫码工具
sleep 2s;
echo "

正在安装qrencode扫码工具，请耐心等待
";
sleep 2s;
apt install -y qrencode;

#赋予相关文件权限
sleep 1s;
mkdir /mnts;
sleep 1s;
chmod 777 -R /usr/node;
sleep 1s;
mv ./ttnode-arm/tt_info.sh /root/;
sleep 1s;
chmod 777 /root/tt_info.sh;

#启动甜糖
sleep 1s;
echo "

正在启动甜糖程序，请耐心等待
";
/usr/node/ttnode -p /mnts -i /usr/node/uid.txt;

#获取端口号
sleep 20s;
echo "

甜糖启动成功，正在获取二维码及端口信息，请耐心等侯
";
sleep 20s;
/root/tt_info.sh;
sleep 2s;
echo "

第一次获取甜糖信息可能会出现信息不全，可在脚本运行完成后，手动输入/root/tt_info.sh再次获取甜糖二维码及端口信息

正在清理下载的缓存文件
";

#清除缓存文件
sleep 20s
rm -R ./ttnode-arm
sleep 2s;
echo "

安装结束，10秒后将自动退出脚本，如获取到的甜糖二维码及端口信息不全，请ssh手动输入/root/tt_info.sh
";
sleep 10s
exit 0