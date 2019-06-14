#coding=gbk
#使用ARIMA 模型对非平稳时间序列记性建模操作
#差分运算具有强大的确定性的信息提取能力， 许多非平稳的序列差分后显示出平稳序列的性质， 这是称这个非平稳序列为差分平稳序列。
#对差分平稳序列可以还是要ARMA 模型进行拟合， ARIMA 模型的实质就是差分预算与 ARMA 模型的结合。

#导入数据
import pandas as pd
import matplotlib.pyplot as plt
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf
from statsmodels.tsa.stattools import adfuller
from statsmodels.stats.diagnostic import acorr_ljungbox
from statsmodels.tsa.arima_model import ARIMA

class seq_predict_model:
    def __init__(self):
        pass
    def predict(self,filename = ''):
        filename = r'daily_data.csv'
        data = pd.read_csv('daily-data.csv', index_col = u'date')

        #画出时序图
        plt.rcParams['font.sans-serif'] = ['SimHei']    #定义使其正常显示中文字体黑体
        plt.rcParams['axes.unicode_minus'] = False      #用来正常显示表示负号
        data.plot()
        #plt.show()

        #画出自相关性图
        plot_acf(data)
        #plt.show()

        #平稳性检测

        print('原始序列的检验结果为：',adfuller(data[u'value']))
        #原始序列的检验结果为： (1.8137710150945268, 0.9983759421514264, 10, 26, {'1%': -3.7112123008648155,
        #  '10%': -2.6300945562130176, '5%': -2.981246804733728}, 299.46989866024177)
        #返回值依次为：adf, pvalue p值， usedlag, nobs, critical values临界值 , icbest, regresults, resstore
        #adf 分别大于3中不同检验水平的3个临界值，单位检测统计量对应的p 值显著大于 0.05 ， 说明序列可以判定为 非平稳序列

        #对数据进行差分后得到 自相关图和 偏相关图
        D_data = data.diff().dropna()
        D_data.columns = [u'销量差分']

        D_data.plot()   #画出差分后的时序图
        #plt.show()

        plot_acf(D_data)    #画出自相关图
        #plt.show()
        plot_pacf(D_data)   #画出偏相关图
        #plt.show()
        print(u'差分序列的ADF 检验结果为： ', adfuller(D_data[u'销量差分']))   #平稳性检验
        #差分序列的ADF 检验结果为：  (-3.1560562366723537, 0.022673435440048798, 0, 35, {'1%': -3.6327426647230316,
        # '10%': -2.6130173469387756, '5%': -2.9485102040816327}, 287.5909090780334)
        #一阶差分后的序列的时序图在均值附近比较平稳的波动， 自相关性有很强的短期相关性， 单位根检验 p值小于 0.05 ，所以说一阶差分后的序列是平稳序列

        #对一阶差分后的序列做白噪声检验
        print(u'差分序列的白噪声检验结果：',acorr_ljungbox(D_data, lags= 1)) #返回统计量和 p 值
        # 差分序列的白噪声检验结果： (array([11.30402222]), array([0.00077339])) p值为第二项， 远小于 0.05

        #对模型进行定阶

        pmax = int(len(D_data) / 10)    #一般阶数不超过 length /10
        qmax = int(len(D_data) / 10)
        bic_matrix = []
        for p in range(pmax +1):
            temp= []
            for q in range(qmax+1):
                try:
                    temp.append(ARIMA(data, (p, 1, q)).fit().bic)
                except:
                    temp.append(None)
                bic_matrix.append(temp)

        bic_matrix = pd.DataFrame(bic_matrix)   #将其转换成Dataframe 数据结构
        p,q = bic_matrix.stack().idxmin()   #先使用stack 展平， 然后使用 idxmin 找出最小值的位置
        print(u'BIC 最小的p值 和 q 值：%s,%s' %(p,q))  #  BIC 最小的p值 和 q 值：0,1
        #所以可以建立ARIMA 模型，ARIMA(0,1,1)
        model = ARIMA(data, (p,1,q)).fit()
        #model.summary()        #生成一份模型报告
        yp = model.forecast(5)   #为未来5天进行预测， 返回预测结果， 标准误差， 和置信区间
        print("the result ：1")
        print(yp[0])
        print("the result ：2")
        predict_data = [str(x) for x in yp[0]]
        print(predict_data)
        print("the result ：3")
        return ','.join(predict_data)

if __name__ == '__main__':
    model = seq_predict_model()
    predict_data = model.predict()
    print(predict_data)
    #nn.train('阴燃火')
    #nn.train('非火')
