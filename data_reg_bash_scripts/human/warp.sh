for i in `ls *.nii`; do

# if the labelRegs file for this image doesn't yet exist
  if [ ! -f ../labelRegsCommon/$i ]; then
    echo $i
    /home/jessica-bohm/niftyreg/build/reg-apps/reg_resample -ref $i -flo ../../../MDSC689.03-Final-Project/atlases/human_seg_common_ras_fix_origin.nii -res ../labelRegsCommon/$i -aff ../atlasAffineTrans/${i::-3}txt -inter 0
    
    /home/jessica-bohm/niftyreg/build/reg-apps/reg_resample -ref $i -flo ../labelRegsCommon/$i -res ../labelRegsCommon/$i -cpp ../atlasSplineTrans/$i -inter 0
  fi
done

# ends with the completed transformed atlas in ../labelRegs/$i
