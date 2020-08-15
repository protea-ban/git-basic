# 银行营销数据进分析报告

## 1. 数据集质量评估 

1. 数据完整性

   ```python
   bank_data.isnull().any()
   ```

   ![image-20200815171214542](https://gitee.com/proteaban/blogimages/raw/master/img/20200815171214.png)

   从结果图中也能看出，没有数据缺失问题。

   2. 数据有效性和准确性

      ```python
      bank_data.describe()
      bank_data.describe(include='all')
      bank_data['balance'][bank_data['balance']<0]
      ```

      ![](https://gitee.com/proteaban/blogimages/raw/master/img/20200815171454.PNG)

      ![image-20200815171622787](https://gitee.com/proteaban/blogimages/raw/master/img/20200815171623.png)

      从结果图中可以看出，balance 中最小值竟然是 -6847，这显然是错误的，而对 balance 进行更进一步的探索，发现其为负值的数量达 688 条。

## 2. 对数据进行统计分析，对该数据集进行描述（数据分布、数值范围等） 

```pyton
new_bank_data = bank_data[bank_data['balance']>0]
new_bank_data.describe()
```

首先将余额为负值的数据从数据集中去除，然后再对数据进行统计分析，该操作可以用函数 describe 来完成，结果如下图

![image-20200815172139239](https://gitee.com/proteaban/blogimages/raw/master/img/20200815172139.png)

在所有储户当中，年龄最小的才 18 岁，最大的已经有 95 岁，平均年龄为 41 岁。账户余额方面，最少的仅有 1 ，最高达 81204，平均余额为 1781.889 。存款期限最长达 3881 天，而最短才2天，平均存款期限是372天。

## 3. 数据集字段之间彼此关联关系

![image-20200815221409006](https://gitee.com/proteaban/blogimages/raw/master/img/20200815221409.png)

年龄与余额呈正相关，程度较高；余额与存款期限呈正相关，程度较低；余额与营销活动次数呈负相关，年龄与存款期限呈正相关，年龄与参与营销活动次数呈正相关，而参与营销活动次数与存款期限呈负相关。

代码地址：