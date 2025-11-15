#!/bin/bash
source env/bin/activate
seed=`slip39 -v --bits 256 --show --no-card`
rnd256=$(echo "$seed" | awk 'match($0, /0x[0-9a-fA-F]+/) {print substr($0, RSTART+2, RLENGTH-2)}')
# test vector:
rnd256='4d2fd549a041921cec8a8d2a90d9f438d6a5cec74d1cd256fd5f5a2955c182d1'
otp=$(echo -n "$rnd256" | sha512sum | cut -d' ' -f1)$(echo -n "$rnd256" | sha256sum | cut -d' ' -f1)
sha256_otp=$(echo -n "$otp" | sha256sum | cut -d' ' -f1)

# debug: echo 'OTP: '$otp
# debug: echo 'SHA256(OTP): '$sha256_otp

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
