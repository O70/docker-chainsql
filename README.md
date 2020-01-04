# [ChainSQL](https://github.com/ChainSQL/chainsqld) Dockerfile

## 运行单节点

### 构建并运行

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

### 生成`validation_public_key`及`validation_seed`

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

### 重启容器

``` sh
$ docker restart cs
```

## ChainSQL网络搭建

### 准备

``` sh
$ cd /path/to/chainsql/
$ mkdir node{1..4} ; echo node* | xargs -n 1 cp -v chainsqld.cfg 
```

### 启动容器

``` sh
$ docker run -d --name cs-node1 \
	-p 5006:5006 \
	-p 5126:5126 \
	-p 6006:6006 \
	-v /path/to/chainsql/node1:/data/ \
	guiwang/chainsql:0.30.5

$ docker run -d --name cs-node2 \
	-p 5007:5006 \
	-p 5127:5126 \
	-p 6007:6006 \
	-v /path/to/chainsql/node2:/data/ \
	guiwang/chainsql:0.30.5

$ docker run -d --name cs-node3 \
	-p 5008:5006 \
	-p 5128:5126 \
	-p 6008:6006 \
	-v /path/to/chainsql/node3:/data/ \
	guiwang/chainsql:0.30.5

$ docker run -d --name cs-node4 \
	-p 5009:5006 \
	-p 5129:5126 \
	-p 6009:6006 \
	-v /path/to/chainsql/node4:/data/ \
	guiwang/chainsql:0.30.5
```

### 生成`validation_public_key`及`validation_seed`

``` sh
$ docker exec -it cs-node1 chainsqld validation_create
Loading: "/data/chainsqld.cfg"
{
   "validation_key" : "TRIM AM IT SAIL GUN SIS IOTA GALL KING GRAD FOG WOOD",
   "validation_private_key" : "pfnwc2v7X4sNCRawVDL9gV67KXdH4DhuQAAcZyd3AzevMwq3RWL",
   "validation_public_key" : "n9LFZQX5UU1gvwzH8W2GT6syKzH7cLd6Hgab3MHjNbdZSiZ1PTbR",
   "validation_public_key_hex" : "032BDC49DFA5FCF9516D3A1C495A822F422CE23ACAD371714916B46A11D57EC720",
   "validation_seed" : "xcBY1pqSHBrbSVgom1qdRbbvL5uor"
}
$ docker exec -it cs-node2 chainsqld validation_create
Loading: "/data/chainsqld.cfg"
{
   "validation_key" : "WIND CLUE MINI ALIA BALM BOIL DOE NOR CHUB NUMB GILT TRAG",
   "validation_private_key" : "pfcKHyHT9rPBYtw9tQk52eHUHz8ySkMomvWyiQx8H67s3TBM5rT",
   "validation_public_key" : "n9LEjGEZdCsT4WPbABwLuHgT1a7VcEhxXpuXjTgindwmyqyHbEXh",
   "validation_public_key_hex" : "02E150DC785B33A113122F29B068F25A37C6B291E583837CE6890538EBFD11034F",
   "validation_seed" : "xn8T8TqBjJyKHS8oXvt4rKmTRix4R"
}
$ docker exec -it cs-node3 chainsqld validation_create
Loading: "/data/chainsqld.cfg"
{
   "validation_key" : "CODA HESS LOY TED OUT BONA SLY VAN TOLL RUB GIFT CHEF",
   "validation_private_key" : "pcGcWknarN8g8g6FMxryW2Ehuc4SimFaicEbLs7xeR7Q2sqgqkE",
   "validation_public_key" : "n9Kq8wce4E3kFmtUPBbkUACMae3tptf4J5wHGeH6wTSjJy5VmZs6",
   "validation_public_key_hex" : "02AAEF29123E78CD0574158E377782952AE8FBD4B0101300901BD08E496F5A2CDD",
   "validation_seed" : "xnXts7PmLJqxrK5YjJdmsidypCUnB"
}
$ docker exec -it cs-node4 chainsqld validation_create
Loading: "/data/chainsqld.cfg"
{
   "validation_key" : "BORG BARK TEN SUP FORT DUNE FOAL OAK TACK BALL WARM SAG",
   "validation_private_key" : "pf9T8xAwn6PGF6UL3rsNYn3uxSMeuQrYMb2kFw5E3UKjn5PJcnV",
   "validation_public_key" : "n9JZniNvs9oTn9NdKsLwQ5FZLEfjtZ3FqEwP833BsgLzDAC7AHX3",
   "validation_public_key_hex" : "02015485E75F426416EF4C926838DF3B0C97F014C23BC36984145169F70DB64068",
   "validation_seed" : "xhKRhU6fpdNqNdNvAfouugniB9taq"
}
```

**依次替换`/path/to/chainsql/node[1-4]/chainsqld.cfg`中的`validation_seed`与`validation_public_key`选项.**

### 配置`ips`与`validators`选项

```
[ips]
10.10.3.5 5126
10.10.3.5 5127
10.10.3.5 5128
10.10.3.5 5129

[validators]
n9LFZQX5UU1gvwzH8W2GT6syKzH7cLd6Hgab3MHjNbdZSiZ1PTbR
n9LEjGEZdCsT4WPbABwLuHgT1a7VcEhxXpuXjTgindwmyqyHbEXh
n9Kq8wce4E3kFmtUPBbkUACMae3tptf4J5wHGeH6wTSjJy5VmZs6
n9JZniNvs9oTn9NdKsLwQ5FZLEfjtZ3FqEwP833BsgLzDAC7AHX3
```

**需要剔除节点本身的ip端口以及公钥.**

### 重启容器

``` sh
$ docker restart cs-node{1..4}
```

### 查看节点信息

- 查看当前节点信息
``` sh
$ docker exec -it cs-node1 chainsqld server_info
```

- 查看其它节点的运行情况
``` sh
$ docker exec -it cs-node1 chainsqld peers 
```

- 生成/查看根账户
``` sh
$ docker exec -it cs-node1 chainsqld wallet_propose masterpassphrase
```
