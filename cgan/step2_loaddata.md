Training a CGAN requires a well labelled dataset. For this scenario we will use the Fashion MNIST dataset. Which is labelled by apparel type and is easy to see how well the generator matches classes.

We will first do some of the standard imports for libraries like TensforFlow/Keras, numpy and matplotlib like so:
```python
import numpy as np
import numpy.random as R
from tensorflow.keras.datasets.fashion_mnist import load_data
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.models import Sequential, Model
from tensorflow.keras.layers import Input, Dense, Reshape, Flatten, Conv2D, Conv2DTranspose
from tensorflow.keras.layers import LeakyReLU, Dropout, MaxPooling2D, Embedding, Concatenate
import matplotlib.pyplot as plt
from tqdm import tqdm
```{{execute}}

This scenario uses the Functional API for constructing a network. In previous scenarios we used the Sequential API. The difference allows us to combine or concatenate the labels to the images we will train on.

We will encapsulate the data loading into a function like so:
```python
def load_real_samples():
	(x_train, y_train), (_, _) = load_data()
	X = np.expand_dims(x_train, axis=-1)
	X = X.astype('float32')
	X = (X - 127.5) / 127.5
	return [X, y_train]

```{{execute windows}}

The Fashion MNIST is a dataset of 28x28 images as shown in the figure below. 

![MNIST Fashion](assets/fashion_mnist.png?raw=true)

In this scenario we load both the images and training labels. As well we normalize as well as shift the data around 0, [-1:+1], by using the X- 127.5 / 127.5. Network training will often work better if data is normalized and shifted to around 0.

We can load the data with: 
```python
dataset = load_real_samples()
print(dataset[0].shape)
```{{execute}}

Now we setup a helper function to save a plot of the dataset like so:
```python
def save_plot(examples, n=10):
  plt.figure(figsize=(10,10))
  for i in range(n * n):
  	plt.subplot(n, n, 1 + i)
  	plt.axis('off')
  	plt.imshow(examples[i].reshape(28,28), cmap='gray_r')
  filename = 'contents/generated_plot.png'
  plt.show()
  plt.savefig(filename)
  plt.close()

dataset = load_real_samples()
print(dataset[0].shape)
```{{execute windows}}

Next we will write a function that samples from the real dataset with:
```python
def generate_real_samples(dataset, n_samples):
	images, labels = dataset
	ix = R.randint(0, images.shape[0], n_samples)
	X, labels = images[ix], labels[ix]
	y = np.ones((n_samples, 1))
	return [X, labels], y

real,_ = generate_real_samples(dataset, 100)
print(real[0].shape)
save_plot(real[0])
```{{execute windows}}

**generate_real_samples** generates a batch of real samples and labels them with a 1, for real. It also adds the real labels to the output of the dataset.

We will now use the IDE tab and VS Code to view the output image `generated_plot.png`.

Click on the IDE tab and then click on the file `generated_plot.png` in the file folder sidebar.

You can refer back to the IDE at any time to recall what the images looked like.








