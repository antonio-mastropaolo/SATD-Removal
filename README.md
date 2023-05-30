# Towards Automatically Addressing Self-Admitted Technical Debt: How Far Are We?

Upon evolving their software, organizations and individual developers have to spend conspicuous effort to pay back technical debt, i.e., the fact that software is released in a shape not as good as it should be, e.g., in terms of functionality, reliability, or maintainability. This paper empirically investigates the extent to which technical debt can be automatically paid back by neural-based generative models, and in particular models exploiting different strategies for pre-training and fine-tuning. We start by extracting a dateset of 5,039 Self-Admitted Technical Debt (SATD) removals from 809 open-source projects. SATD refers to technical debt instances documented (\eg via code comments) by developers. We use this dataset to experiment with seven different generative deep learning (DL) model configurations. Specifically, we compare transformers pre-trained and fine tuned with different combinations of training objectives, including the fixing of generic code changes, SATD removals, and SATD-comment prompt tuning. Also, we investigate the applicability in this context of a recently-available Large Language Model-based chat bot. Results of our study indicate that the automated removal of SATD is a challenging task, with the best model we experimented with able to automatically fix $\sim$2\% to 8\% of test instances, depending on the number of attempts it is allowed to make. Given the limited size of the fine-tuning dataset ($\sim$5k instances), the model's pre-training plays a fundamental role in boosting performance. Also, the ability to remove SATD steadily drops if the comment documenting the SATD is not provided as input to the model. 

#### Pipeline Description

To replicate the experiments you can rely on this two files *codet5.py* and *t5-no-pt.py*.
While the former can be used to train M1, M2_cc as well as the ablation model (i.e., M2-cc-ablation), the latter serves the no pre-training experiment. Before starting replicating any of the experiments we performed, make sure to install the requirements (see *requirements.txt*)


#### Fine-tuning  



##### Training

```shell
python3.9 codet5.py 
        --model_name=model.bin   
        --output_dir=./models/M1/
        --tokenizer_name=Salesforce/codet5-base
        --model_name_or_path=Salesforce/codet5-base
        --do_train
        --epochs 50
        --encoder_block_size 1024
        --decoder_block_size 1024
        --train_batch_size 2     
        --eval_batch_size 2   
        --learning_rate 2e-5     
        --max_grad_norm 1.0     
        --evaluate_during_training     
        --seed 123456  2>&1 | tee ./models/M1/train.log

```

##### Inference

```shell
python3.9 codet5.py 
        --model_name=model.bin   
        --output_dir=./models/M1/
        --tokenizer_name=Salesforce/codet5-base
        --model_name_or_path=Salesforce/codet5-base
        --do_test
        --encoder_block_size 1024
        --decoder_block_size 1024
        --eval_batch_size 8
        --num_beams=1   
```


#### Datasets :paperclip:

* The datasets for fine-tuning the models are stored on GDrive <a href="https://drive.google.com/drive/folders/1E9e2XLglz8C9p6bhWaxSBWym7ISq2d42?usp=sharing">here</a>
* The dataset for supervised pre-training which includes code changes (Tufano et al.) is available here <a href="https://drive.google.com/drive/folders/1v9IiMsmBUYBQ8apDyjGhP_nkGOY6FSUP?usp=sharing">here</a>

#### Models :bar_chart:
* <a href="https://drive.google.com/drive/folders/1SOeXRpVWoCqogjaktrXlY-o49wZ5PkdH?usp=sharing">T5-base No-Pretraining (M0)</a>
* <a href="https://drive.google.com/drive/folders/1oqd3WIQDHkAo9bfgirOVz4NvBZMXnSEY?usp=sharing">CodeT5-SATD (M1)</a>
* <a href="https://drive.google.com/drive/folders/1rhDlRvNLlq0kToh39OL6us5Y9yUnHNHF?usp=sharing">CodeT5-Code-Changes</a>
* <a href="https://drive.google.com/drive/folders/1W8lMHeYIQ0FgXuFXyAWnPl_tz9SDNk2c?usp=sharing">CodeT5-Code-Changes + Fine-tuning on SATD removal dataset (M2-cc)</a>
* <a href="https://drive.google.com/drive/folders/1Z7qOK73nLlyFUUpPah5s8YJCT7bQ5ed_?usp=sharing">CodeT5-Code-Changes + Fine-tuning on SATD removal ablated dataset (M3-cc-ablation) </a>



#### Results:  :open_file_folder:
* <a href="https://drive.google.com/drive/folders/1-sOjs5oBxzaBzuLkSl3WWAW8fS916GBa?usp=sharing">T5-base No-Pretraining (M0)</a>
* <a href="https://drive.google.com/drive/folders/11BJ18E5dcBBk6xttQSvfBowD2_fQdItX?usp=sharing">CodeT5-SATD (M1)</a>
* <a href="https://drive.google.com/drive/folders/1vFtWLuOWEP6tRzPNAz8ghQfyZgCH0GCV?usp=sharing">CodeT5-Code-Changes + Fine-tuning on SATD removal dataset (M2-cc)</a>
* <a href="https://drive.google.com/drive/folders/1rFBHBGWwIFVzdV5P--nkaLNX_G05GsRN?usp=sharing">CodeT5-Code-Changes + Fine-tuning on SATD removal ablated dataset (M3-cc-ablation) </a>
* <a href="https://drive.google.com/drive/folders/1qI2YNUnOwt9G2skrwyAe1Txn-D5d4wHJ?usp=sharing">ChatGPT</a>


#### Additional:  :page_facing_up:

* <a href="https://drive.google.com/drive/folders/1g_c2z1GRKi3qX_EIYNYEWW_OI0fHXoCu?usp=sharing">Data for Statistical Tests (i.e., McNemar and Wilcoxon)</a>
