import uvicorn
import pickle as pck
from fastapi import FastAPI
from data_strut import GlucoseData

app=FastAPI()
model_path="../saved_version.pkl"

def read_model(path:str):
    with open(path,"rb") as model:
        return pck.load(model)

model=read_model(model_path)
    
@app.post("/predictions") 
def predictions(data:GlucoseData):
    features=[[data.CGM,data.CHO,data.insuline]]
    prediction=model.predict(features).tolist()
    return {"dd":prediction}

if __name__ == "main":
    uvicorn.run(app,host="127.0.0.1",port=8000)