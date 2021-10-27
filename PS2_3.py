import pandas as pd
import matplotlib.pyplot as plt
data = pd.read_csv('2281305.csv')  #读取数据
data.head()
VIS = data['VIS'].str.split(',',expand=True)   #将所用数据分列
data[['distance','distance quality','variability','quality variability']] = VIS   #分列后的数据导入新的列
res = data['DATE'].str.split('-',expand=True)
data[['YEAR','MONTH','DAY']] = res
data.head(10)
VIS=data[['distance','YEAR','MONTH','distance quality']]   #选出所用到的数据
VIS.head(10)
VIS = VIS.astype('int')   #转换类型
VIS = VIS[~VIS['distance'].isin([999999])]    #去掉所缺失数据
VIS = VIS[VIS['distance quality'].isin([1])]    #能见度数据分级，如果不是1级代表数据可信度低，在此进行筛选
VIS = VIS.drop(columns=['distance quality'])
VIS.groupby(['YEAR','MONTH']).mean('distance').plot(figsize=(30,10))    #将能见度按照年月聚类计算，看变化趋势
VIS.groupby(['YEAR','MONTH']).min('distance').plot.bar(figsize=(50,20))   #plot出能见度最小值，与风速关系进行对比
VIS.groupby(['YEAR','MONTH']).max('distance').plot.bar(figsize=(50,20))  #plot出能见度最大值，与风速关系进行对比
VIS.describe()   #计算出能见度的标准差
VIS.loc[(VIS['distance']<5000)].count()    #人为的进行分类，将能见度小于5000定位视野差，5000-15000为视野一般，大于15000为视野极好，计算对应天数
VIS.loc[(VIS['distance']>15000)].count()
VIS.loc[(VIS['distance']<15000)&(VIS['distance']>5000)].count()













