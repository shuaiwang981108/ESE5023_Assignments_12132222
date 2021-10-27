import pandas as pd 
import matplotlib.pyplot as plt
Sig_Eqs = pd.read_csv("earthquakes.tsv", sep='\t')  #将原文件导入
Sig_Eqs.head()       
#1.1
Sig_Eqs.groupby(['Country']).sum('Total Deaths').sort_values("Total Deaths", ascending=False).head(10)   #通过国家聚类，计算总死亡人数，并按照降序排列，列出前十名
#1.2
newset=Sig_Eqs.loc[(Sig_Eqs['Mag']>6 )].groupby(['Year']).count()  #建立一个新的newset,选出震级大于6的，并聚类计算
newset['Country'].plot()
#1.3
def CountEq_LargestEq(country_input):
    number = Sig_Eqs.loc[(Sig_Eqs['Country'] == country_input)].shape[0]   #选出国家
    mag = Sig_Eqs.loc[(Sig_Eqs['Country'] == country_input)].sort_values('Mag').head(2)   #震级进行排序
    date = str(int(mag.iat[0,1]))+'-'+str(mag.iat[0,2])+'-'+str(mag.iat[0,3])    #选出最大地震的时间
    print('the total number of earthquakes since 2150 B.C. in '+country_input+'is '+str(number))
    print('the date of the largest earthquake ever happened in '+country_input+'is '+str(date))


import numpy as np
Sig_Eqs = Sig_Eqs.drop(index=0)
Sig_Eqs = Sig_Eqs.drop(index=6271)   #去掉无用列
country_input_array = Sig_Eqs['Country'].apply(str).unique()
country_input_array_sorted = sorted(country_input_array,key = str.lower,reverse=True)
country_input_array_sorted = np.array(country_input_array_sorted)
for x in country_input_array_sorted:    #循环，打印出所有国家发生的最大地震
    country_input = x
    CountEq_LargestEq(country_input)






