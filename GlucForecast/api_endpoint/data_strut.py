from pydantic import BaseModel

class GlucoseData(BaseModel):
    CGM:float
    CHO:float
    insuline:float
