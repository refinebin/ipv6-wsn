import websocket
from fire_detection_camera.inceptionV1_OnFire_jpg2 import Fire_Detection_Camera
from fire_detection_sensor.fire_detection_sensor_minghuo import fire_detection_sensor_minghuo
from fire_detection_sensor.fire_detection_sensor_yingran import fire_detection_sensor_yinran
from fire_detection_sensor.fire_detection_sensor_wuhuo import fire_detection_sensor_wuhuo
from sensor_time_seq_predict.seq_predict_model import seq_predict_model
try:
    import thread
except ImportError:
    import _thread as thread


def on_message(ws, server_message):
    '''

    :param ws:
    :param server_message:
            (1)图片/视频监测火灾，消息格式： 1@http://xxx.jpg@datetime
            (2)传感器数据监测火灾，消息格式：2@温度数值#一氧化碳数值#烟雾数值@datetime
            (3)时序预测，消息格式：3@http://xxx.csv
    :return:(1)火灾时返回：1@datetime
                非火灾时返回：0@datetime
             (2)明火概率@datetime
             阴燃火概率@datetime
             无火概率@datetime
             (3) 数值1,数值2,数值3,数值4,数值5

    '''
    print(server_message)
    print('收到服务器消息:%s' % server_message)

    flag,msg,datetime = (str)(server_message).split('@')
    print("flag: "+flag)
    if flag == '1':#1@http://xxx.jpg@datetime
        result = detection_camera_model.predict_img(msg)
    elif flag == '2':#2@温度数值#一氧化碳数值#烟雾数值@datetime
        print(msg)
        type, dat = (str)(msg).split('#')
        data = (dat).split('!')
        if type == '1':#明火
            result = detection_sensor_minghuo_model.predict(data)
        elif type == '2':#阴燃火
            result = detection_sensor_yinran_model.predict(data)
        elif type == '3':#无火
            result = detection_sensor_wuhuo_model.predict(data)
        else:
            print('参数错误 %s' % msg)
    elif flag == '3':#时间序列预测  3@http://xxx.csv
        result = seq_predict_model.predict(msg)


    #result = detection_camera_model.predict_img(server_message)
    ws.send(str(result)+'@'+datetime)


def on_error(ws, error):
    print(error)

def on_close(ws):
    print("### closed ###")


def on_open(ws):
    '''
    #向服务器发送信息
    :param ws: web服务器对象
    :return:
    '''
    def run(*args):
        #'''
        ws.send("python客户端上线")

        # for i in range(3):
            #time.sleep(1)
            # ws.send("客户端:Hello %d" % i)
        #time.sleep(1)
        # ws.close()
        # print("thread terminating...")
        # '''
    thread.start_new_thread(run, ())


if __name__ == "__main__":
    # 启动模型
    print("火灾诊断启动中...")

    #1. 诊断火灾模型 - 图像/图片
    detection_camera_model = Fire_Detection_Camera()
    #2. 诊断火灾模型 - 传感器数据
    #明火
    detection_sensor_minghuo_model = fire_detection_sensor_minghuo()
    detection_sensor_minghuo_model.train_classification_model()
    #阴燃
    detection_sensor_yinran_model = fire_detection_sensor_yinran()
    detection_sensor_yinran_model.train_classification_model()
    #无火
    detection_sensor_wuhuo_model = fire_detection_sensor_wuhuo()
    detection_sensor_wuhuo_model.train_classification_model()

    #3. 时间序列预测 - 传感器数据

    print("模型创建完毕")
    websocket.enableTrace(True)
    # url
    ws = websocket.WebSocketApp("ws://",
                                header={"name":"py"},
                              on_message = on_message,
                              on_error = on_error,
                              on_close = on_close)


    #ws.on_open("python客户端上线")
    ws.on_open = on_open
    ws.run_forever()