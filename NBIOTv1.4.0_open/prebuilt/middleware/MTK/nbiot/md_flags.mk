# This file contain flags which are common to all MD full target builds. Flags for cosim build are in sys/module.mk


CFLAGS += -DMTK_NBIOT_TARGET_BUILD
CFLAGS += -DDEVELOPMENT_VERSION

# SYS flags
CFLAGS += -D__arm
CFLAGS += -DFRT_KERNEL
CFLAGS += -DKI_RLG_ENABLE_EVENT_OVER_HSL
# Add extra Debug checking including Null pointer overwriting
CFLAGS += -DKI_CHECK_ASSERTIONS
CFLAGS += -DKI_DISABLE_DYNAMIC_MEMORY
CFLAGS += -DTEMP_FPGA_ML1S_HACKS
CFLAGS += -DNBIOT_TRACE_FILTER
#  CFLAGS += -DFEA_TEMP_APMD_FAKE_SERVICE
#  CFLAGS += -DIRQ_SPEED_DEBUG
# GKI configuration switches
CFLAGS += -DKI_ENABLE_OWN_QUEUEING
CFLAGS += -DKI_TIME_USE_TEN_MILLISECOND_TICK
# Development options
# This has a def in the ASMDEFS area that must be kept in line with this one
#CFLAGS += -DDEVELOPMENT_STACKS

# Enable below 2 definitions if you want to take GKI logs from boot
# NOTE! When enabling logs from boot target execution is waiting Genie to be connected
#     ! Disable KI_TTI_ENABLE_STATIC_FILTER definition if want all logs without filtering
#   CFLAGS += -DKI_TTI_LOG_ALL_SIGNALS_FROM_BOOT
ifeq ($(FPGA_ENV), y)
CFLAGS += -DKI_MAX_LOGGING_MEMORY=76000
else
ifeq ($(ULS_FUNCTION_PROFILER),y)
CFLAGS += -DKI_MAX_LOGGING_MEMORY=4000
else
CFLAGS += -DKI_MAX_LOGGING_MEMORY=160000
endif
endif
CFLAGS += -DKI_TTI_ENABLE_STATIC_FILTER
# MP3 and maindev branches have contain now different amount of signals, because obsolete signals have
# been removed from maindev branch.
# This may cause assert from signals matrix size check when nvdm have been written from maindev branch,
# and same HW use also mp3 branch. KI_TTI_DISABLE_FILTER_SIZE_CHECK flag is enabled to skip this check.
CFLAGS += -DKI_TTI_DISABLE_FILTER_SIZE_CHECK

CFLAGS += -DKI_ASSERTFAIL_REMOVE_DEFAULT

#    CFLAGS += -DSS_MPU_ENABLED
#Additional debug info for blockset
CFLAGS += -DKI_MEMORY_USAGE
# FreeRTOS Specific build options
CFLAGS += -DKI_DISABLE_KM_DYNAMIC_MEMORY
CFLAGS += -DUSE_ULS
CFLAGS += -DUSE_FILTER_PRECHECK_FUNCTION
CFLAGS += -DMTK_PLATFORM_MT2625
CFLAGS += -DDONT_DISPLAY_ASSERTFAIL_MSG
CFLAGS += -DKI_ASSERT_NO_HSL
CFLAGS += -DKI_EXTENDED_DEBUG
#    CFLAGS += -DKI_ENABLE_ADDRESS_ZERO_CHECK
CFLAGS += -DKI_DISABLE_STACK_POOLS
CFLAGS += -DTASKSWITCH_PRINTF

ifeq ($(FEATURE_EMMI_IN_USE),y)
ifeq ($(NO_EMMI_TIMERS),y)
CFLAGS += -DNO_EMMI_TIMERS
endif
ifneq ($(DISABLE_KIPRINTF),y)
    CFLAGS += -DUSE_KIPRINTF_AS_PRINTF
endif
    CFLAGS += -DEMMI_BAUD_RATE_921600
    CFLAGS += -DROM_TEST_TASK
    CFLAGS += -DEMMI_UART_DMA_MODE
    CFLAGS += -DEMMI_TX_BUFF_SIZE=512
    CFLAGS += -DEMMI_RX_BUFF_SIZE=512
    CFLAGS += -DEMMI_MAX_NUM_RX_BLOCKS=10
ifeq ($(MTK_PORT_SERVICE_ENABLE),y)
    CFLAGS += -DEMMI_UART_PORT_USED=SERIAL_PORT_DEV_UART_1
#    CFLAGS += -DEMMI_UART_PORT_USED=SERIAL_PORT_DEV_USB_COM1
else
    CFLAGS += -DEMMI_UART_PORT_USED=HAL_UART_1
endif
else
    CFLAGS += -DNO_EMMI_INTERFACE
endif

ifeq ($(MTK_PORT_SERVICE_ENABLE),y)
ifeq ($(MTK_CONNL_VIA_PORT_SERVICE_ENABLE),y)
    CFLAGS += -DMTK_CONNL_VIA_PORT_SERVICE
    CFLAGS += -DMTK_CONNL_2ND_AT_PORT
endif
endif

# 3GPP release version flags
CFLAGS += -DUPGRADE_REL4
CFLAGS += -DUPGRADE_REL5
CFLAGS += -DUPGRADE_REL6
CFLAGS += -DUPGRADE_REL7
CFLAGS += -DUPGRADE_REL8
CFLAGS += -DUPGRADE_REL8_USIM
CFLAGS += -DUPGRADE_REL9
CFLAGS += -DUPGRADE_SAT99

# PLMN flags
CFLAGS += -DENABLE_EPLMN
CFLAGS += -DENABLE_EHPLMN
CFLAGS += -DUSE_TTP_AL
CFLAGS += -DUSE_ABAPP
CFLAGS += -DUPGRADE_GENERIC_MUX

#CFLAGS += -DENABLE_CMCC_FEATURE
CFLAGS += -DGPRS_ATTACH_AT_POWER_ON
CFLAGS += -DENABLE_CIRM_DATA_IND
CFLAGS += -DENABLE_LONG_AT_CMD_RSP

# NASMDL2 flags
CFLAGS += -DUPGRADE_NASMDL2

ifeq ($(ENABLE_L4MM_ALLOC),y)
CFLAGS += -DUSE_L4MM_ALLOC_MEMORY
else
CFLAGS += -DUSE_BMM_ALLOC_MEMORY
endif

# MUX LBS flags
ifeq ($(ENABLE_CSCI_MUX_LBS),y)
CFLAGS += -DUPGRADE_CSCI_MUX_LBS
endif

# LTE flags
CFLAGS += -DENABLE_LTE_UPLANE_HSL
CFLAGS += -DUPGRADE_LTE
CFLAGS += -DUPGRADE_LTE_FDD
CFLAGS += -DUPGRADE_NB

# 3G_MODE flags
CFLAGS += -DUPGRADE_3G
CFLAGS += -DUPGRADE_3G_TDD128
CFLAGS += -DUPGRADE_3G_HSDPA
CFLAGS += -DUPGRADE_3G_HSUPA
CFLAGS += -DUPS_CFG_E_DCH_CATEGORY_6
CFLAGS += -DUPS_CFG_HS_DSCH_CATEGORY_8
CFLAGS += -DUPS_CFG_TDD128_HS_DSCH_CATEGORY_13

# SIM/USIM flags
CFLAGS += -DSIM_EMU_3G
CFLAGS += -DSIM_UICC_DEBUG_ATR3
CFLAGS += -DUSIM_EMU_USE_EXPANDED_FORMAT
CFLAGS += -DSIM_DEBUG_ATR
CFLAGS += -DUPGRADE_HIGH_SPEED_SIM
CFLAGS += -DSIM_EMU_ENABLE_EONS
#CFLAGS += -DSIM_EMU_SIM_TOOLKIT
CFLAGS += -DSIM_UICC_USE_VALUES_FROM_ATR
CFLAGS += -DSIM_EMU_EMM_INFO_SUPPORTED
CFLAGS += -DSIM_DEBUG_COMMANDS
CFLAGS += -DENABLE_SIM_DRV_V2

CFLAGS += -DUPGRADE_CSCI_MUX
CFLAGS += -DCONN_LAYER
CFLAGS += -DUPGRADE_CONN_MDT_NB

# BMM/MEM flags
CFLAGS += -DENABLE_BMM_MEM_OP_DEBUG

# PPPAD flags
CFLAGS += -DINCLUDE_PPPA_EMULATION

# Temporary flag for ppp implementations
ifeq ($(MTK_PPP_ENABLE), y)
    CFLAGS += -DMTK_PPP_ENABLE
    CFLAGS += -DFEA_PPP
endif

ifeq ($(MTK_AGNSS_SUPL2_ENABLE), y)
  CFLAGS += -DMTK_AGNSS_SUPL2_ENABLE
endif

# Exclude Components
CFLAGS += -DEXCLUDE_L1MM
CFLAGS += -DEXCLUDE_CDMG
CFLAGS += -DEXCLUDE_DBG
CFLAGS += -DEXCLUDE_DSP_MULTIMEDIA
CFLAGS += -DEXCLUDE_U1CD
CFLAGS += -DEXCLUDE_U1IT
CFLAGS += -DEXCLUDE_EBMM
CFLAGS += -DEXCLUDE_DM

## TODO remove when possible
CFLAGS += -DDM_EXCLUDE_RTC_DEVICE_MANAGER

CFLAGS += -DDM_EXCLUDE_NVRAM_DEVICE_DRIVER
CFLAGS += -DREMOVE_CB
CFLAGS += -DDISABLE_DAI
CFLAGS += -DDISABLE_ATCI_LTE_GCF_SUPPORT
CFLAGS += -DABSH_EXCLUDE_CC
CFLAGS += -DABSH_EXCLUDE_CB
CFLAGS += -DABSH_EXCLUDE_LM

CFLAGS += -DDISABLE_AUTO_SIM_POWERUP
CFLAGS += -DDISABLE_AUTO_PS_POWERUP

# AP Bridge flags
ifeq ($(MTK_NBIOT_AP_BRIDGE_ENABLE), y)
    CFLAGS += -DENABLE_AP_BRIDGE_FEATURE
endif

#Bitfile speed
ifeq ($(BF20SLOW), y)
    CFLAGS += -DBITFILE_20SLOW
endif

#Hardwired CP user data loopback
ifeq ($(CP_LOOPBACK), y)
    CFLAGS += -DFEA_TEMP_HARDWIRED_CP_LOOPBACK
endif

#Gki logging for extern customer
CFLAGS += -DFR_HSL_2_GKI

#Enable N1 test sequencer
#CFLAGS += -DFEA_N1_TEST_SQ_ENABLE

#Enable CMUX UIH frame CR PF bit check
#CFLAGS += -DFEA_CMUX_CR_CHECK

ifeq ($(MTK_AUTO_BAUD_RATE_ENABLE), y)
CFLAGS += -DMTK_AUTO_BAUD_RATE_ENABLE
endif

#Enable AT+IPR set with immediate effect no restart needed
#CFLAGS += -DMTK_IPR_WIE_WITHOUT_RESTART
