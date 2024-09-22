## 本项目实现的最终作用是基于SSH食品加工厂管理系统
## 分为1个角色
### 第1个角色为管理员角色，实现了如下功能：
 - 入库信息管理
 - 出库信息管理
 - 商品种类管理
 - 在库信息管理
 - 查看统计信息
 - 管理员登录
## 数据库设计如下：
# 数据库设计文档

**数据库名：** ssh_shipinchang_sys

**文档版本：** 


| 表名                  | 说明       |
| :---: | :---: |
| [tb_account](#tb_account) |  |
| [tb_atstore](#tb_atstore) |  |
| [tb_goods](#tb_goods) |  |
| [tb_instore](#tb_instore) |  |
| [tb_outstore](#tb_outstore) |  |
| [tb_partner](#tb_partner) |  |

**表名：** <a id="tb_account">tb_account</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 32 |   0    |    N     |  Y   |       |   |
|  2   | USERNAME |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  3   | PASSWORD |   varchar   | 32 |   0    |    Y     |  N   |   NULL    |   |
|  4   | REAL_NAME |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  5   | LINK_PHONE |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  6   | REG_DATE |   datetime   | 19 |   0    |    Y     |  N   |   NULL    |   |
|  7   | SEX |   varchar   | 2 |   0    |    Y     |  N   |   NULL    |   |
|  8   | AGE |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  9   | ADDRESS |   varchar   | 200 |   0    |    Y     |  N   |   NULL    |   |
|  10   | ID_CARD |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  11   | ROLE_LEVEL |   varchar   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  12   | STATE |   varchar   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  13   | NOTE |   varchar   | 200 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="tb_atstore">tb_atstore</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 32 |   0    |    N     |  Y   |   ''    |   |
|  2   | RELATION_ID |   varchar   | 32 |   0    |    Y     |  N   |   NULL    |   |
|  3   | GOODS_ID |   varchar   | 32 |   0    |    Y     |  N   |   NULL    |   |
|  4   | AMOUNT |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  5   | NOTE |   varchar   | 200 |   0    |    Y     |  N   |   NULL    |   |
|  6   | GOODS_NAME |   varchar   | 50 |   0    |    Y     |  N   |   NULL    |   |
|  7   | UINT |   varchar   | 10 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="tb_goods">tb_goods</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 32 |   0    |    N     |  Y   |       |   |
|  2   | NAME |   varchar   | 50 |   0    |    Y     |  N   |   NULL    |   |
|  3   | CODE |   varchar   | 32 |   0    |    Y     |  N   |   NULL    |   |
|  4   | TYPE |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  5   | SPECIFICATION |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  6   | PRODUCTION_DATE |   date   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  7   | SHELF_LIFE |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  8   | UNIT |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  9   | PRICE |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  10   | NOTE |   varchar   | 200 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="tb_instore">tb_instore</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 32 |   0    |    N     |  Y   |   ''    |   |
|  2   | GOODS_ID |   varchar   | 32 |   0    |    Y     |  N   |   NULL    |   |
|  3   | PROVIDER_ID |   varchar   | 32 |   0    |    Y     |  N   |   NULL    |   |
|  4   | USER_ID |   varchar   | 32 |   0    |    Y     |  N   |   NULL    | 用户ID  |
|  5   | IN_DATE |   datetime   | 19 |   0    |    Y     |  N   |   NULL    |   |
|  6   | PRICE |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  7   | AMOUNT |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  8   | NOTE |   varchar   | 200 |   0    |    Y     |  N   |   NULL    |   |
|  9   | GOODS_NAME |   varchar   | 50 |   0    |    Y     |  N   |   NULL    |   |
|  10   | PROVIDER_NAME |   varchar   | 50 |   0    |    Y     |  N   |   NULL    |   |
|  11   | USERNAME |   varchar   | 32 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="tb_outstore">tb_outstore</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 32 |   0    |    N     |  Y   |   ''    |   |
|  2   | GOODS_ID |   varchar   | 32 |   0    |    Y     |  N   |   NULL    |   |
|  3   | CONSUMER_ID |   varchar   | 32 |   0    |    Y     |  N   |   NULL    |   |
|  4   | USER_ID |   varchar   | 32 |   0    |    Y     |  N   |   NULL    | 用户ID  |
|  5   | OUT_DATE |   datetime   | 19 |   0    |    Y     |  N   |   NULL    |   |
|  6   | PRICE |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  7   | AMOUNT |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  8   | NOTE |   varchar   | 200 |   0    |    Y     |  N   |   NULL    |   |
|  9   | GOODS_NAME |   varchar   | 50 |   0    |    Y     |  N   |   NULL    |   |
|  10   | CONSUMER_NAME |   varchar   | 50 |   0    |    Y     |  N   |   NULL    |   |
|  11   | USERNAME |   varchar   | 50 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="tb_partner">tb_partner</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   varchar   | 32 |   0    |    N     |  Y   |       |   |
|  2   | NAME |   varchar   | 50 |   0    |    Y     |  N   |   NULL    |   |
|  3   | TYPE |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  4   | PROPERTY |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  5   | ADDRESS |   varchar   | 100 |   0    |    Y     |  N   |   NULL    |   |
|  6   | LINK_MAN |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  7   | LINK_PHONE |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  8   | TELPHONE |   varchar   | 20 |   0    |    Y     |  N   |   NULL    |   |
|  9   | NOTE |   varchar   | 200 |   0    |    Y     |  N   |   NULL    |   |

