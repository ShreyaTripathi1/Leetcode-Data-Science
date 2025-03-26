import pandas as pd

def getDataframeSize(players: pd.DataFrame) -> List[int]:
    return list(players.shape)
    # lst=[players.index.size,players.columns.size]
    # return lst
