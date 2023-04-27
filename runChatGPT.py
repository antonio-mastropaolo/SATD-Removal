import openai
import pandas as pd
from tqdm import tqdm
import os

openai.api_key = "put_your_openai_key_here"


templates = {
    1: 'Remove this SATD: {} from the following code {} as follows: ',
    2: 'Perform removal of this SATD: {} from this code {} as follows: ',
    3: 'This code {} contains the following SATD: {} removed with: '
}

def main():
    df = pd.read_csv('test.csv')

    savedReponses = []
    predictions = []
    for idx, row in tqdm(df.iterrows()):
       
        inputComment = row['comment']
        inputCodeBefore = row['function_before']
        inputCodeAfter = row['function_after']
        
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            messages=[
                #{"role": "user", "content": templates[3].format(inputCodeBefore,inputComment)}
                {"role": "user", "content": templates[1].format(inputComment,inputCodeBefore)}
            ]
        )
        
        
        prediction = response['choices'][0]['message']['content']
        
        with open('results-t1/predictions_{}.txt'.format(idx),'w') as f:
            f.write(prediction)




if __name__ == '__main__':
    main()
