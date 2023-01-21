Anaconda Install
================

```
cp -rf .bashrc .bashrc.SAVE
cd Downloads/
curl https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh --output anaconda.sh
sha256sum anaconda.sh
bash anaconda.sh 
cd
diff -s .bashrc .bashrc.SAVE
mv .bashrc .bashrc.CONDA
mv .bashrc.SAVE .bashrc
alias conda_start='source ~/.bashrc.CONDA'
conda_start

```

