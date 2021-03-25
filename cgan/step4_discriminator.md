Now we can move on to creating the discriminator and DCGAN models. 

We will first create the discriminator with:
```python
def build_discriminator(in_shape=(28,28,1), n_classes=10):
	in_label = Input(shape=(1,))
	label = Embedding(n_classes, 50)(in_label)
	n_nodes = in_shape[0] * in_shape[1]
	label = Dense(n_nodes)(label)
	label = Reshape((in_shape[0], in_shape[1], 1))(label)
	in_image = Input(shape=in_shape)
	merge = Concatenate()([in_image, label])
	disc = Conv2D(128, (3,3), strides=(2,2), padding='same')(merge)
	disc = LeakyReLU(alpha=0.2)(disc)
	disc = Conv2D(128, (3,3), strides=(2,2), padding='same')(disc)
	disc = LeakyReLU(alpha=0.2)(disc)
	disc = Flatten()(disc)
	disc = Dropout(0.4)(disc)
	out_layer = Dense(1, activation='sigmoid')(disc)
	model = Model([in_image, in_label], out_layer)
	opt = Adam(lr=0.0002, beta_1=0.5)
	model.compile(loss='binary_crossentropy', optimizer=opt, metrics=['accuracy'])
	return model

discriminator = build_discriminator()
discriminator.summary()
```{{execute windows}}

The discriminator model here is almost an inverse of the generator. Notice how it includes the label embeddings layer and the concatenation of the label with the image. Also note how the output activation function here is sigmoid, since this model still does a real/fake classification.

Next, we can take both the generator and discriminator models and create the combined CGAN model with:
```python
def build_cgan(g_model, d_model):
	d_model.trainable = False
	gen_noise, gen_label = g_model.input
	gen_output = g_model.output
	gan_output = d_model([gen_output, gen_label])
	model = Model([gen_noise, gen_label], gan_output)
	opt = Adam(lr=0.0002, beta_1=0.5)
	model.compile(loss='binary_crossentropy', optimizer=opt)
	return model

cgan = build_cgan(generator, discriminator)
cgan.summary()
```{{execute windows}}

This model is similar to the GAN/DCGAN but differs in that it needs to also handle and account for the labels.












