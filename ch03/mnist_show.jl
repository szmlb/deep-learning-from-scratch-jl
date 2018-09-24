import Images
import ImageView
import MLDatasets: MNIST

x = MNIST.convert2image(MNIST.traintensor(1))
guidict = ImageView.imshow(x)

# If we are not in a REPL
if (!isinteractive())

    # Create a condition object
    c = Condition()

    # Get the window
    win = guidict["gui"]["window"]

    # Wait for the notification before proceeding ...
    wait(c)
end
