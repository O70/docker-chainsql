# [ChainSQL](https://github.com/ChainSQL/chainsqld) Dockerfile

## 构建并运行

``` sh
$ docker build -t guiwang/chainsql:0.30.5 .

$ mkdir /path/to/chainsql/
$ cp chainsqld.cfg /path/to/chainsql/

$ docker run -d --name cs \
	-p 5006:5006 \
	-p 5126:5126 \
	-p 6006:6006 \
	-v /path/to/chainsql/:/data/ \
	guiwang/chainsql:0.30.5
```

## 生成`validation_public_key`及`validation_seed`

``` sh
$ docker exec -it cs chainsqld validation_create
Loading: "/data/chainsqld.cfg"
{
   "validation_key" : "NAME NAT SETS ABED MAN JURY MULE BOOK HEAL WAR BEAT RAP",
   "validation_private_key" : "pc7DNWzNvAg6bieYoHgY7yYLGpXqWJAWXhWv9GZ4b7sRPgFjuYY",
   "validation_public_key" : "n9LwYRUShor7GmBWSt5R3j19a6rtWKRrHDT8hDpF64gsfT2LsdiW",
   "validation_public_key_hex" : "02D589C48FA0ACB28805C8289D1BE994B1A5E561793CFEA6F3C1B0E00F2DAF4EFC",
   "validation_seed" : "xhUFHHrcDqapVMibL87xyh5fB299L"
}
```

替换`/path/to/chainsql/chainsqld.cfg`中的`validation_seed`与`validation_public_key`选项:
```
# 本节点私钥（如不配置，不参与共识）
[validation_seed]
xhUFHHrcDqapVMibL87xyh5fB299L

# 本节点公钥
[validation_public_key]
n9LwYRUShor7GmBWSt5R3j19a6rtWKRrHDT8hDpF64gsfT2LsdiW
```

## 重启容器

``` sh
$ docker restart cs
```
