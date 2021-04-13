The CGAN model is built we can move on to training with:

```python
batch_size = 128
epochs = 1
bat_per_epo = int(dataset[0].shape[0] / batch_size)
half_batch = int(batch_size / 2)
for i in range(epochs):
  for j in tqdm(range(bat_per_epo)):
    [X_real, labels_real], y_real = generate_real_samples(dataset, half_batch)
    d_loss1, _ = discriminator.train_on_batch([X_real, labels_real], y_real)
    [X_fake, labels], y_fake = generate_fake_samples(generator, latent_dim, half_batch)
    d_loss2, _ = discriminator.train_on_batch([X_fake, labels], y_fake)
    [z_input, labels_input] = generate_latent_vector(latent_dim, batch_size)
    y_gan = np.ones((batch_size, 1))
    g_loss = cgan.train_on_batch([z_input, labels_input], y_gan)
  print('>Loss Discriminator: %.0f%%, %.0f%% , Generator: %.0f%%' % (d_loss1,d_loss2,g_loss))
```{{execute windows}}

Training for the CGAN may take some time so please be patient. After the training is complete we can generate an output plot with classes like so:

```python
def generated_plot(examples, n):
  plt.figure(figsize=(10,10))
  for i in range(n * n):
    plt.subplot(n, n, 1 + i)
    plt.axis('off')
    plt.imshow(examples[i, :, :, 0], cmap='gray_r')
  filename = 'contents/generated_plot.png'
  plt.show()
  plt.savefig(filename)
  plt.close()

latent_vectors, labels = generate_latent_vector(100, 100)
labels = np.asarray([x for _ in range(10) for x in range(10)])
generated  = generator.predict([latent_vectors, labels])
generated = (generated + 1) / 2.0
generated_plot(generated, 10)
```{{execute windows}}

This code will output a set of 10 classes of 10 generated images for each class. Notice how the generated output is rescaled back to values of 0 to 1 for display. Negative values will not render on a matplotlib plot and would be cut off.

We will now use the IDE tab and VS Code to view the output image `generated_plot.png`.

Click on the IDE tab and then click on the file `generated_plot.png` in the file folder sidebar.

You can refer back to the IDE at any time to recall what the images looked like.


















