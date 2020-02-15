/* Copyright Statement:
*
* (C) 2005-2017  MediaTek Inc. All rights reserved.
*
* This software/firmware and related documentation ("MediaTek Software") are
* protected under relevant copyright laws. The information contained herein
* is confidential and proprietary to MediaTek Inc. ("MediaTek") and/or its licensors.
* Without the prior written permission of MediaTek and/or its licensors,
* any reproduction, modification, use or disclosure of MediaTek Software,
* and information contained herein, in whole or in part, shall be strictly prohibited.
* You may only use, reproduce, modify, or distribute (as applicable) MediaTek Software
* if you have agreed to and been bound by the applicable license agreement with
* MediaTek ("License Agreement") and been granted explicit permission to do so within
* the License Agreement ("Permitted User").  If you are not a Permitted User,
* please cease any access or use of MediaTek Software immediately.
* BY OPENING THIS FILE, RECEIVER HEREBY UNEQUIVOCALLY ACKNOWLEDGES AND AGREES
* THAT MEDIATEK SOFTWARE RECEIVED FROM MEDIATEK AND/OR ITS REPRESENTATIVES
* ARE PROVIDED TO RECEIVER ON AN "AS-IS" BASIS ONLY. MEDIATEK EXPRESSLY DISCLAIMS ANY AND ALL
* WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NONINFRINGEMENT.
* NEITHER DOES MEDIATEK PROVIDE ANY WARRANTY WHATSOEVER WITH RESPECT TO THE
* SOFTWARE OF ANY THIRD PARTY WHICH MAY BE USED BY, INCORPORATED IN, OR
* SUPPLIED WITH MEDIATEK SOFTWARE, AND RECEIVER AGREES TO LOOK ONLY TO SUCH
* THIRD PARTY FOR ANY WARRANTY CLAIM RELATING THERETO. RECEIVER EXPRESSLY ACKNOWLEDGES
* THAT IT IS RECEIVER'S SOLE RESPONSIBILITY TO OBTAIN FROM ANY THIRD PARTY ALL PROPER LICENSES
* CONTAINED IN MEDIATEK SOFTWARE. MEDIATEK SHALL ALSO NOT BE RESPONSIBLE FOR ANY MEDIATEK
* SOFTWARE RELEASES MADE TO RECEIVER'S SPECIFICATION OR TO CONFORM TO A PARTICULAR
* STANDARD OR OPEN FORUM. RECEIVER'S SOLE AND EXCLUSIVE REMEDY AND MEDIATEK'S ENTIRE AND
* CUMULATIVE LIABILITY WITH RESPECT TO MEDIATEK SOFTWARE RELEASED HEREUNDER WILL BE,
* AT MEDIATEK'S OPTION, TO REVISE OR REPLACE MEDIATEK SOFTWARE AT ISSUE,
* OR REFUND ANY SOFTWARE LICENSE FEES OR SERVICE CHARGE PAID BY RECEIVER TO
* MEDIATEK FOR SUCH MEDIATEK SOFTWARE AT ISSUE.
*/
/*
 **************************************************************************
 * File Description : This file defines the signal definition include
 *     files for the common Protocol Stack signal set.
 *     This file is only included into KISIGINC.H. There is no multiple
 *     inclusion protection as this file can be included more than once
 *     in the same file. If you add a new include into this file you may
 *     also need to add an include into KISIGUNI.H that defines the signal
 *     structures. Building a signal database (that includes the
 *     new signals) in a PC test tool (e.g. Genie, use Signal Maker to
 *     check signals appear with the correct structures) will check that
 *     signal definitions have been correctly added to the system.
 **************************************************************************/

/***************************************************************************
 * IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT
 *
 * Please read the file description above as it contains information on
 * other changes that might be needed if you change this file.
 *
 * IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT
 ***************************************************************************/

#if !defined (EXCLUDE_GSM_PS)
# include <pssig.h>
#endif

#if !defined (EXCLUDE_UT)
# include <utsig.h>
#endif

#if !defined (ENABLE_PLTSIM)
#if !defined (EXCLUDE_VG)
# include <vgsig.h>
#endif

#if defined (UPGRADE_GENERIC_MUX)
#  include <pppadtestsigdef.h>
#endif

#if !defined (EXCLUDE_VG)
# include <vgexsig.h>
#endif

#endif /* ENABLE_PLTSIM */
#if defined (UPGRADE_GENERIC_MUX)
#  include <muxsigdef.h>
#if defined (UPGRADE_NASMDL2)
#  include <connsigdef.h>
#  include <mdtsigdef.h>
#else /* UPGRADE_NASMDL2 */
#  include <muxconnsigdef.h>
#endif /* else UPGRADE_NASMDL2 */
/* TODO: Remove the 2 includes below related to MUXconn interface under #else part of UPGRADE_NASMDL2 */
#  include <uartsigdef.h>
#if defined (UPGRADE_SHARE_MEMORY)
#  include <shmconnsigdef.h>
#elif defined (UPGRADE_SHMCL_SOLUTION)
#  include <shmconnsigdef_pruned.h>
#endif
#endif /* UPGRADE_GENERIC_MUX */

#if defined (UPGRADE_RTSP)
#  include <rtspsig.h>
#endif

#if defined (UPGRADE_RTP)
#  include <rtpsig.h>
#endif

#ifdef ENABLE_AP_BRIDGE_FEATURE
#include<ciapbsigdef.h>
#endif

/* END OF FILE */

