# Apply previously computed affine and then spline transformations to each
# sample, using labels as moving image and sample as ref

for i in `ls *.nii`; do

# if the labelRegs file for this image doesn't yet exist
  if [ ! -f ../labelRegsCommon/$i ]; then
    echo $i
    # reg_resample transforms the image based on previously computed transformations
    # the ref image is still the untransformed $i
    # the first image being transformed is the atlas - labelsReformat
    # Apply the computed affine and save to ../labelRegs
    /home/jessica-bohm/niftyreg/build/reg-apps/reg_resample -ref $i -flo ../../../../MDSC689.03-Final-Project/atlases/mouse_seg_common.nii -res ../labelRegsCommon/$i -aff ../atlasAffineTrans/${i::-3}txt -inter 0
    # next apply the spline to the just edited atlas in labels regs
    /home/jessica-bohm/niftyreg/build/reg-apps/reg_resample -ref $i -flo ../labelRegsCommon/$i -res ../labelRegsCommon/$i -cpp ../atlasSplineTrans/$i -inter 0
  fi
done

# ends with the completed transformed atlas in ../labelRegs/$i 
