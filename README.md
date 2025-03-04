## Notes:
- mouse images need to be rotated by `sitk.PermuteAxes(mouse_labels_seg_mask, [0, 2, 1])"`

- env setup: 

    `conda create --name img_proc python=3.12 -y`

    `conda install -c conda-forge simpleitk matplotlib pandas numpy vtk -y`