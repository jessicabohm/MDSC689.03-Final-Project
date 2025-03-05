## Notes:
- mouse images need to be rotated by `sitk.PermuteAxes(mouse_labels_seg_mask, [0, 2, 1])"`

- env setup: 

    `conda create --name img_proc python=3.12 -y`

    `conda install -c conda-forge simpleitk matplotlib pandas numpy vtk -y`

- img proc workflow:

    1. <b>Input:</b> a mouse atlas (dim) and labels ()
        <br> a human atlas () and labels () 

    2. skull strip the mouse atlas image, to put in same space as labels before cropping

    3. align mouse and human atlases to common space (for training a translating model and comparing structures) [for not align by fixing aspect ratio and matching y dim]
        - Do by cropping imgs, scaling, then padding to a cube of the same dimension 
    
    4. to register human imgs - just apply affine transform

    5. to register mouse imgs - first skull strip with unskull stripped atlas and mask, then register by affine to modified common atlas