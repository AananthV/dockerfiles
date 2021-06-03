# Machine Learning

Used to spin up a container with
- ubuntu18 with CUDA support
- gcc
- python3

Python Packages
- numpy 
- matplotlib 
- pandas 
- torch torchvision torchaudio 
- scikit-learn 
- notebook
- nltk
- tqdm

## Building

```bash
docker build . -t [tag]
```

## Bash Aliases

To make life easy. Replace \[tag\] with the tag used while building the image.

```bash
# Python3 on CPU
mlpython() { 
	docker run \
		-v $PWD:/tmp/working \
		-w=/tmp/working \
		--rm \
		-it [tag] \
		python3 "$@"
}

# Jupyter Notebook on CPU
mlnotebook() { 
	(
		sleep 3 && 
		firefox "http://127.0.0.1:8888"
	) & 
	docker run \
		-v $PWD:/tmp/working \
		-w /tmp/working \
		-p 8888:8888 \
		--rm \
		-it [tag] \
		jupyter notebook \
			--no-browser \
			--notebook-dir=/tmp/working \
			--ip 0.0.0.0 \
			--NotebookApp.token='' \
			--NotebookApp.password=''
}

# Python3 with GPU support
gmlpython() { 
	docker run \
		-v $PWD:/tmp/working \
		-w /tmp/working \
		--rm \
		--gpus all \
		--device /dev/nvidia0 \
		--device /dev/nvidia-uvm \
		--device /dev/nvidia-uvm-tools \
		--device /dev/nvidiactl \
		-it [tag] \
		python3 "$@"
}

# Jupyter notebook with GPU support
gmlnotebook() {
	(
		sleep 3 && 
		firefox "http://127.0.0.1:8888"
	) & 
	docker run \
		-v $PWD:/tmp/working \
		-w /tmp/working \
		-p 8888:8888 \
		--rm \
		--gpus all \
		--device /dev/nvidia0 \
		--device /dev/nvidia-uvm \
		--device /dev/nvidia-uvm-tools \
		--device /dev/nvidiactl \
		-it [tag] \
		jupyter notebook \
			--no-browser \
			--notebook-dir=/tmp/working \
			--ip 0.0.0.0 \
			--NotebookApp.token='' \
			--NotebookApp.password=''
}
```