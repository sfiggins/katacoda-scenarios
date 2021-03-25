A conditional GAN or CGAN uses the labels in a training set as conditions to generation and discrimination. In a CGAN we train the discriminator to not only identify what is real or fake but if it is real or fake for a given class or attribute. Likewise, the generator is not just trained to generate a real image but a real image for a given class.

__NOTE: TensorFlow is being upgraded and this may block the terminal window for a minute or so. While you wait click on the IDE tab to preload VS Code.__

The figure below shows the difference between a vanilla GAN and conditional GAN. In the CGAN you can see how the labels are used with both the real and fake images fed into the discriminator. This allows a discriminator to learn if the image is real but it also matches the correct class.

![CGAN](assets/cgan.png?raw=true)

We also use the label in the generator to constrain or condition the output to be class specific. This will allow us to later generate images for a specific class in our Fashion dataset.

This scenario assumes you are already familiar with a GAN and DCGAN. We will use a DCGAN as the basis for the CGAN in this scenario.








