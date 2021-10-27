import pandas as pd
wind_speed = pd.read_csv('2281305.csv')  #读取文件
wind_speed.head()
speed = wind_speed['WND'].str.split(',',expand=True)    #找到风速有关数据，进行分列
wind_speed[['angle','angle quality','type','speed rate','speed quality']] = speed   #将分好的作为新的column
res = wind_speed['DATE'].str.split('-',expand=True)   #时间分列
wind_speed[['YEAR','MONTH','DAY']] = res   
wind_speed.head(10)
newset=wind_speed[['speed rate','YEAR','MONTH','speed quality']]   #只选取风速，时间等数据作为新的set
newset.head(10)
newset = newset.astype('int')   #转化为int数据
newset = newset[~newset['speed rate'].isin([9999])]    #数据存在大量9999的缺失数据，需要筛选出来并删除
newset = newset[newset['speed quality'].isin([1])]   #根据用户手册可知，speed quality为1的时候数据可信，其他可信度较低，所以此处删除不为1的数据
newset = newset.drop(columns=['speed quality'])   
newset.groupby(['YEAR','MONTH']).mean('speed rate').plot(figsize=(30,10))  #plot结果






