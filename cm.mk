$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/cdma.mk)

# Bootanimation
TARGET_BOOTANIMATION_NAME := vertical-720x1280
$(call inherit-product, device/htc/vigor/vigor.mk)

# Device naming
PRODUCT_NAME := cm_vigor
PRODUCT_DEVICE := vigor
PRODUCT_MODEL := ADR6425LVW
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_vigor BUILD_ID=IML74K BUILD_FINGERPRINT="verizon_wwe/htc_vigor/vigor:4.0.3/IML74K/570011.14:user/release-keys" PRIVATE_BUILD_DESC="4.05.605.14 CL570011 release-keys"

# Release name
PRODUCT_RELEASE_NAME := Vigor
-include vendor/cm/config/common_versions.mk
