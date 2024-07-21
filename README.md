# Colored Image Segmentation
 
![PostGit](https://github.com/user-attachments/assets/0355514a-2dcf-4a44-b195-2a38cbbe8e5b)

An interesting gift for your loved ones has been seen around on the internet in the past years. You upload a picture of you with your special other (be it your partner, dog, parent or mentor) and some contractor will segment the picture into few dominant colors present in the image and send you a pseudo painting which contains color borders and color labels (numbers).

You and/or your significant other will be able to paint inside of the labelled image borders on the painting paper according to the colors decided and the end product is a lovely painting which can be placed in a personal space to remind you of the times you had with that person/pet.

The process involves some steps:
1) Image segmentation after color reduction and color labelling.
2) Separation of colors which essentially means to make an image with the color borders and insert the labelled image inside the color borders.
3) Printing of the above image onto paper which is thick and big enough for paintings.
4) Taking each color determined by the color reduction algorithm and getting an oil color in real life.

This commit is the first step in this whole process - reducing the millions of colours inside an image to 'k' different colors, in our case around 30 to 50 colors so as to make it feasible for painting. 

The algorithm used for this purpose was 'K-Means Clustering' but simple early results showed a lot of 'color noise' which had to be treated somehow. In the above context, color noise is the appearance of two different colors in a way which is not smooth to the eye. It may be colorable but it certainly did not look good. For example, a light on a small part of a subject's face made the pixels around that spot to appear 'randomly distributed', so instead of a smooth ellipse/contour of colors, jagged color changes came to surface.

To solve this problem I added an option to divide the picture into two parts, the background and a foreground wherein the user can decide a 'Region Of Interest'. Instead of dividing 50 colours on a whole image where the background may contains high frequencies which attract a lot of colours, the user can now divide the subject, a couple or a dog etc. into 40 colors but keep only 10 colors for the background, which dramatically increases the depth retention of the photo.

The following steps will be added gradually - there is no fixed time-table in mind.
Note, the images above were taken from copyright-free image websites but if conflicts still arise, please feel free to notify me via GitHub.

