import uvicorn
import pickle as pck
from fastapi import FastAPI
from data_strut import GlucoseData,GlucForecast,InsuDose
from keras.models import load_model
import numpy as np
from sklearn.preprocessing import MinMaxScaler



app=FastAPI()

# GlucoseData
BG_model_path="../BG_metadata.pkl"
def read_model(path:str):
    with open(path,"rb") as model:
        return pck.load(model)
BG_model=read_model(BG_model_path)

@app.post("/predictions/BG") 
def predictions(data:GlucoseData):
    features=[[data.CGM,data.CHO,data.insuline]]
    prediction=BG_model.predict(features).tolist()
    return {"dd":prediction}


# GlucForecast
Forcast_model_path="../BG_metadata.pkl"
Forcast_model=load_model(Forcast_model_path)

# InsuDose
Insulin_model_path="../Insulin_metadata.pkl"
def read_model(path:str):
    with open(path,"rb") as model:
        return pck.load(model)
Insulin_model=read_model(Insulin_model_path)
@app.post("/predictions/Insulin") 
def InsuDose_Pipline(data:InsuDose):
    features = np.array(data.BG).reshape(-1,1)
     # Feature scaling
    scaler = MinMaxScaler(feature_range = (0,1))
    Glucose_act = scaler.fit_transform(features)
    
    Insulin_pred = Insulin_model.predict(Glucose_act)

    Insulin_pred = np.array(Insulin_pred).reshape(-1,1)
    #Inverse transform predictions
    BG_pred = scaler.inverse_transform(Insulin_pred)
    return BG_pred.reshape(1)[0]
    
   


if __name__ == "main":
    uvicorn.run(app,host="127.0.0.1",port=8000)