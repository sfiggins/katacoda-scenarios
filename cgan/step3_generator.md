The generator now needs to account for the labels in the images it generates. In order to do that we merge or concatenate the label with the generated image within the network. 

That makes our generator model now look like:
```python
latent_dim = 100

def build_generator(latent_dim, n_classes=10):
	in_label = Input(shape=(1,))
	label = Embedding(n_classes, 50)(in_label)
	n_nodes = 7 * 7
	label = Dense(n_nodes)(label)
	label = Reshape((7, 7, 1))(label)
	in_latent = Input(shape=(latent_dim,))
	n_nodes = 128 * 7 * 7
	gen = Dense(n_nodes)(in_latent)
	gen = LeakyReLU(alpha=0.2)(gen)
	gen = Reshape((7, 7, 128))(gen)
	merge = Concatenate()([gen, label])
	gen = Conv2DTranspose(128, (4,4), strides=(2,2), padding='same')(merge)
	gen = LeakyReLU(alpha=0.2)(gen)
	gen = Conv2DTranspose(128, (4,4), strides=(2,2), padding='same')(gen)
	gen = LeakyReLU(alpha=0.2)(gen)
	out_layer = Conv2D(1, (7,7), activation='tanh', padding='same')(gen)
	model = Model([in_latent, in_label], out_layer)
	return model

generator = build_generator(latent_dim)
generator.summary()
```{{execute windows}}

There are a few key differences here between a GAN/DCGAN and CGAN. The first is the use of the label as input to an **Embedding** layer. This allows the network to break down the class label into it's own embedding space. Next we can see how this embedding is concatenated with the generated image and fed into the network. Lastly, notice the use of the **tanh** activation function. The output from tanh is from -1 to +1 where the output from sigmoid is 0 to +1.

Next, we want to create a couple helper functions that will allow us to use the generator to create fake images with:
```python
def generate_latent_vector(latent_dim, n_samples, n_classes=10):
	x_input = R.randn(latent_dim * n_samples)
	z_input = x_input.reshape(n_samples, latent_dim)
	labels = R.randint(0, n_classes, n_samples)
	return [z_input, labels]
 
def generate_fake_samples(generator, latent_dim, n_samples):
	z_input, labels_input = generate_latent_vector(latent_dim, n_samples)
	images = generator.predict([z_input, labels_input])
	y = np.zeros((n_samples, 1))
	return [images, labels_input], y

fake,_ = generate_fake_samples(generator, latent_dim, 100)
print(fake[0].shape)
save_plot(fake[0])
```{{execute windows}}

The **generate_latent_vector** function generates the random input for the generator as well as random labels. **generate_fake_samples** takes as input the generator, latent size and number of samples to output. 

We will now use the IDE tab and VS Code to view the output image `generated_plot.png`.

Click on the IDE tab and then click on the file `generated_plot.png` in the file folder sidebar.

You can refer back to the IDE at any time to recall what the images looked like.







