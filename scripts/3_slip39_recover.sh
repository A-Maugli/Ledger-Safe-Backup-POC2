#!/bin/bash
source env/bin/activate
result=$(slip39-recovery -v)
# debug: echo $result
rnd256=$(echo "$result" | awk 'match($0, /[0-9a-fA-F]{64}/) {print substr($0, RSTART, RLENGTH)}')
# test vector: rnd256='4d2fd549a041921cec8a8d2a90d9f438d6a5cec74d1cd256fd5f5a2955c182d1'
# debug: echo $rnd256
otp=$(echo -n "$rnd256" | sha512sum | cut -d' ' -f1)$(echo -n "$rnd256" | sha256sum | cut -d' ' -f1)
# debug: echo "OTP: "$otp
sha256_otp=`echo -n $otp | sha256sum`
# debug: echo "SHA256(OTP): "$sha256_otp

# Write out OTP in 4 byte parts
for i in {0..23}; do
    start=$((i * 8))
    chunk=$(echo -n "${otp:$start:8}" | tr '[:lower:]' '[:upper:]')
    printf "OTP%02d: %s\n" $((i + 1)) "$chunk"
done

# Compute checksum
checksum=$(echo -n "${sha256_otp:0:8}" | tr '[:lower:]' '[:upper:]')
echo "Checksum(OTP): $checksum"

exit 0