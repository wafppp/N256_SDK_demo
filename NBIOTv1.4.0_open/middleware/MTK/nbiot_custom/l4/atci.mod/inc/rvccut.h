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
 * File Description
 * ----------------
 *
 * Header file for vgccut.c
 **************************************************************************/

#ifndef RVCCUT_H
#define RVCCUT_H

/***************************************************************************
 * Nested Include Files
 **************************************************************************/

#include <system.h>
#include <rvsystem.h>

/***************************************************************************
 * Manifest Constants
 **************************************************************************/

/***************************************************************************
 * Type Definitions
 **************************************************************************/

/***************************************************************************
 *  Macros
 **************************************************************************/

/***************************************************************************
 *  Function Prototypes
 **************************************************************************/


#if defined (FEA_MT_PDN_ACT)
ResultCode_t vgCcA         (CommandLine_t *commandBuffer_p,
                            const VgmuxChannelNumber entity);
#endif /* FEA_MT_PDN_ACT */

ResultCode_t vgCcH         (CommandLine_t *commandBuffer_p,
                            const VgmuxChannelNumber entity);
ResultCode_t vgCcCHUP      (CommandLine_t *commandBuffer_p,
                            const VgmuxChannelNumber entity);
ResultCode_t vgCcDL        (CommandLine_t *commandBuffer_p,
                            const VgmuxChannelNumber entity);
ResultCode_t vgCcO         (CommandLine_t *commandBuffer_p,
                            const VgmuxChannelNumber entity);

void vgCcDROPPEDTimerExpiry  (const VgmuxChannelNumber entity);

void vgCcCONNECTTimerExpiry  (const VgmuxChannelNumber entity);
void vgCcAbortConnectingCall (const VgmuxChannelNumber entity);
Boolean vgCheckDisconnectAllProgress (const VgmuxChannelNumber entity);
Boolean vgCallIsOfflineState (const VgmuxChannelNumber entity);
void    vgClearEntity                (const VgmuxChannelNumber entity);
Boolean vgCcDisconnectAllCalls       (const VgmuxChannelNumber entity);

void establishDataSession (const VgmuxChannelNumber entity,
                            const ConnectionClass_t connectionClass);

void terminateDataSession    (const VgmuxChannelNumber entity,
                               const ConnectionClass_t connectionClass);
BcdNumberType vgCharToBcdNumberType (const VgDialNumberType typeOfNumber);

void vgCcOpenConnTimerExpiry (const VgmuxChannelNumber entity);
#endif  /* RVCCUT_H */

/* END OF FILE */

