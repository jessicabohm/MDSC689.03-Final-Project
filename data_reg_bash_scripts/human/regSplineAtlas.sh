for i in `ls *.nii`; do
# only run transformation if the affine transformed file exists and the spline doesn't

if [ ! -e ../atlasSplineTrans/$i ] ; then
  echo $i
  # the reference remains the cropped image held in N3? 
  # But now modifying the affine transformed ATLAS image
  # save the full transformed atlas img to "../atlasRegs/$i"
  # -cpp specifies to save the non linear transform as a control point grid to that file
  /home/jessica-bohm/niftyreg/build/reg-apps/reg_f3d -ref $i -flo ../atlasAffineRegs/$i  -res ../atlasRegs/$i -cpp ../atlasSplineTrans/$i -sym
  rm ../atlasRegs/*backward.nii
  rm ../atlasSplineTrans/*backward.nii
fi

done
