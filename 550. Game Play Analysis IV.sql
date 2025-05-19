SELECT 
    ROUND(
        COUNT(DISTINCT a.player_id) / COUNT(DISTINCT b.player_id), 
        2
    ) AS fraction
FROM 
    (
        SELECT 
            player_id, 
            MIN(event_date) AS first_login
        FROM 
            Activity
        GROUP BY 
            player_id
    ) b
LEFT JOIN 
    Activity a 
    ON a.player_id = b.player_id 
    AND a.event_date = DATE_ADD(b.first_login, INTERVAL 1 DAY);

-- -- -------------------------------------------------------------------------------------------------
-- -- IN PANDAS
-- import pandas as pd

-- def gameplay_analysis(activity: pd.DataFrame) -> pd.DataFrame:
--     # Step 1: Find the first login date for each player
--     first_login = activity.groupby('player_id')['event_date'].min().reset_index()
    
--     # Step 2: Create a new column for the day before each event_date in the original DataFrame
--     activity['day_before_event'] = activity['event_date'] - pd.to_timedelta(1, unit='D')
    
--     # Step 3: Merge the dataframes to find rows where player logged in a day after their first login
--     merged_df = activity.merge(first_login, on='player_id', suffixes=('_actual', '_first'))
    
--     # Step 4: Find the rows where the actual event date matches the day after the first login date
--     consecutive_login = merged_df[merged_df['day_before_event'] == merged_df['event_date_first']]
    
--     # Step 5: Calculate the fraction of players that logged in again on the day after their first login
--     fraction = round(consecutive_login['player_id'].nunique() / activity['player_id'].nunique(), 2)
    
--     # Step 6: Create a dataframe to hold the output
--     output_df = pd.DataFrame({'fraction': [fraction]})
    
--     return output_df
