#coding=gbk
#ʹ��ARIMA ģ�ͶԷ�ƽ��ʱ�����м��Խ�ģ����
#����������ǿ���ȷ���Ե���Ϣ��ȡ������ ����ƽ�ȵ����в�ֺ���ʾ��ƽ�����е����ʣ� ���ǳ������ƽ������Ϊ���ƽ�����С�
#�Բ��ƽ�����п��Ի���ҪARMA ģ�ͽ�����ϣ� ARIMA ģ�͵�ʵ�ʾ��ǲ��Ԥ���� ARMA ģ�͵Ľ�ϡ�

#��������
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

        #����ʱ��ͼ
        plt.rcParams['font.sans-serif'] = ['SimHei']    #����ʹ��������ʾ�����������
        plt.rcParams['axes.unicode_minus'] = False      #����������ʾ��ʾ����
        data.plot()
        #plt.show()

        #�����������ͼ
        plot_acf(data)
        #plt.show()

        #ƽ���Լ��

        print('ԭʼ���еļ�����Ϊ��',adfuller(data[u'value']))
        #ԭʼ���еļ�����Ϊ�� (1.8137710150945268, 0.9983759421514264, 10, 26, {'1%': -3.7112123008648155,
        #  '10%': -2.6300945562130176, '5%': -2.981246804733728}, 299.46989866024177)
        #����ֵ����Ϊ��adf, pvalue pֵ�� usedlag, nobs, critical values�ٽ�ֵ , icbest, regresults, resstore
        #adf �ֱ����3�в�ͬ����ˮƽ��3���ٽ�ֵ����λ���ͳ������Ӧ��p ֵ�������� 0.05 �� ˵�����п����ж�Ϊ ��ƽ������

        #�����ݽ��в�ֺ�õ� �����ͼ�� ƫ���ͼ
        D_data = data.diff().dropna()
        D_data.columns = [u'�������']

        D_data.plot()   #������ֺ��ʱ��ͼ
        #plt.show()

        plot_acf(D_data)    #���������ͼ
        #plt.show()
        plot_pacf(D_data)   #����ƫ���ͼ
        #plt.show()
        print(u'������е�ADF ������Ϊ�� ', adfuller(D_data[u'�������']))   #ƽ���Լ���
        #������е�ADF ������Ϊ��  (-3.1560562366723537, 0.022673435440048798, 0, 35, {'1%': -3.6327426647230316,
        # '10%': -2.6130173469387756, '5%': -2.9485102040816327}, 287.5909090780334)
        #һ�ײ�ֺ�����е�ʱ��ͼ�ھ�ֵ�����Ƚ�ƽ�ȵĲ����� ��������к�ǿ�Ķ�������ԣ� ��λ������ pֵС�� 0.05 ������˵һ�ײ�ֺ��������ƽ������

        #��һ�ײ�ֺ������������������
        print(u'������еİ�������������',acorr_ljungbox(D_data, lags= 1)) #����ͳ������ p ֵ
        # ������еİ������������� (array([11.30402222]), array([0.00077339])) pֵΪ�ڶ�� ԶС�� 0.05

        #��ģ�ͽ��ж���

        pmax = int(len(D_data) / 10)    #һ����������� length /10
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

        bic_matrix = pd.DataFrame(bic_matrix)   #����ת����Dataframe ���ݽṹ
        p,q = bic_matrix.stack().idxmin()   #��ʹ��stack չƽ�� Ȼ��ʹ�� idxmin �ҳ���Сֵ��λ��
        print(u'BIC ��С��pֵ �� q ֵ��%s,%s' %(p,q))  #  BIC ��С��pֵ �� q ֵ��0,1
        #���Կ��Խ���ARIMA ģ�ͣ�ARIMA(0,1,1)
        model = ARIMA(data, (p,1,q)).fit()
        #model.summary()        #����һ��ģ�ͱ���
        yp = model.forecast(5)   #Ϊδ��5�����Ԥ�⣬ ����Ԥ������ ��׼�� ����������
        print("the result ��1")
        print(yp[0])
        print("the result ��2")
        predict_data = [str(x) for x in yp[0]]
        print(predict_data)
        print("the result ��3")
        return ','.join(predict_data)

if __name__ == '__main__':
    model = seq_predict_model()
    predict_data = model.predict()
    print(predict_data)
    #nn.train('��ȼ��')
    #nn.train('�ǻ�')
