from pydantic import BaseModel

class GlucoseData(BaseModel):
    CGM:float
    CHO:float
    insuline:float
    

    
class GlucForecast(BaseModel):
    BG:[]                     # List of 4 values of Blood Glucose  

    
    
class InsuDose(BaseModel):
    BG:float                   # Predicted Blood Glucose for 3h in the future
