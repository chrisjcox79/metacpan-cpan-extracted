/*
 * Copyright (c) 2015 Jerry Lundström <lundstrom.jerry@gmail.com>
 * Copyright (c) 2015 .SE (The Internet Infrastructure Foundation)
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#include "crypt_pkcs11_struct.h"

MODULE = Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS  PACKAGE = Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS  PREFIX = crypt_pkcs11_ck_camellia_ctr_params_

PROTOTYPES: ENABLE

Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS*
crypt_pkcs11_ck_camellia_ctr_params_new(class)
    const char* class
PROTOTYPE: $
OUTPUT:
    RETVAL

MODULE = Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS  PACKAGE = Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMSPtr  PREFIX = crypt_pkcs11_ck_camellia_ctr_params_

PROTOTYPES: ENABLE

void
crypt_pkcs11_ck_camellia_ctr_params_DESTROY(object)
    Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS* object
PROTOTYPE: $

SV*
crypt_pkcs11_ck_camellia_ctr_params_toBytes(object)
    Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS* object
PROTOTYPE: $
OUTPUT:
    RETVAL

CK_RV
crypt_pkcs11_ck_camellia_ctr_params_fromBytes(object, sv)
    Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS* object
    SV* sv
PROTOTYPE: $$
OUTPUT:
    RETVAL

CK_RV
crypt_pkcs11_ck_camellia_ctr_params_get_ulCounterBits(object, sv)
    Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS* object
    SV* sv
PROTOTYPE: $$
OUTPUT:
    RETVAL

SV*
crypt_pkcs11_ck_camellia_ctr_params_ulCounterBits(object)
    Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS* object
PROTOTYPE: $
CODE:
    RETVAL = newSV(0);
    crypt_pkcs11_ck_camellia_ctr_params_get_ulCounterBits(object, RETVAL);
OUTPUT:
    RETVAL

CK_RV
crypt_pkcs11_ck_camellia_ctr_params_set_ulCounterBits(object, sv)
    Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS* object
    SV* sv
PROTOTYPE: $$
OUTPUT:
    RETVAL

CK_RV
crypt_pkcs11_ck_camellia_ctr_params_get_cb(object, sv)
    Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS* object
    SV* sv
PROTOTYPE: $$
OUTPUT:
    RETVAL

SV*
crypt_pkcs11_ck_camellia_ctr_params_cb(object)
    Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS* object
PROTOTYPE: $
CODE:
    RETVAL = newSV(0);
    crypt_pkcs11_ck_camellia_ctr_params_get_cb(object, RETVAL);
OUTPUT:
    RETVAL

CK_RV
crypt_pkcs11_ck_camellia_ctr_params_set_cb(object, sv)
    Crypt::PKCS11::CK_CAMELLIA_CTR_PARAMS* object
    SV* sv
PROTOTYPE: $$
OUTPUT:
    RETVAL

MODULE = Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS  PACKAGE = Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS  PREFIX = crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_

PROTOTYPES: ENABLE

Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS*
crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_new(class)
    const char* class
PROTOTYPE: $
OUTPUT:
    RETVAL

MODULE = Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS  PACKAGE = Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMSPtr  PREFIX = crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_

PROTOTYPES: ENABLE

void
crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_DESTROY(object)
    Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS* object
PROTOTYPE: $

SV*
crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_toBytes(object)
    Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS* object
PROTOTYPE: $
OUTPUT:
    RETVAL

CK_RV
crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_fromBytes(object, sv)
    Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS* object
    SV* sv
PROTOTYPE: $$
OUTPUT:
    RETVAL

CK_RV
crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_get_iv(object, sv)
    Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS* object
    SV* sv
PROTOTYPE: $$
OUTPUT:
    RETVAL

SV*
crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_iv(object)
    Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS* object
PROTOTYPE: $
CODE:
    RETVAL = newSV(0);
    crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_get_iv(object, RETVAL);
OUTPUT:
    RETVAL

CK_RV
crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_set_iv(object, sv)
    Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS* object
    SV* sv
PROTOTYPE: $$
OUTPUT:
    RETVAL

CK_RV
crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_get_pData(object, sv)
    Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS* object
    SV* sv
PROTOTYPE: $$
OUTPUT:
    RETVAL

SV*
crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_pData(object)
    Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS* object
PROTOTYPE: $
CODE:
    RETVAL = newSV(0);
    crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_get_pData(object, RETVAL);
OUTPUT:
    RETVAL

CK_RV
crypt_pkcs11_ck_camellia_cbc_encrypt_data_params_set_pData(object, sv)
    Crypt::PKCS11::CK_CAMELLIA_CBC_ENCRYPT_DATA_PARAMS* object
    SV* sv
PROTOTYPE: $$
OUTPUT:
    RETVAL


MODULE = Crypt::PKCS11::CK_CAMELLIA  PACKAGE = Crypt::PKCS11::CK_CAMELLIA

