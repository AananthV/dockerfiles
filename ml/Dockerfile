FROM nvidia/cuda:10.2-devel-ubuntu18.04

# Install python and pip
RUN apt-get update

RUN apt-get install -y --no-install-recommends gcc 
RUN apt-get install -y --no-install-recommends python3 
RUN apt-get install -y --no-install-recommends python3-pip 
RUN apt-get install -y --no-install-recommends python3-wheel 
RUN apt-get install -y --no-install-recommends python3-setuptools

# Install relavant python packages
RUN pip3 install numpy 
RUN pip3 install matplotlib 
RUN pip3 install pandas 
RUN pip3 install torch torchvision torchaudio 
RUN pip3 install scikit-learn 
RUN pip3 install notebook
RUN pip3 install nltk
RUN pip3 install tqdm

# Theme jupyter lol
RUN pip3 install jupyterthemes
RUN jt -t onedork -fs 120 -tfs 12 -nfs 120 -cellw 88% -T
