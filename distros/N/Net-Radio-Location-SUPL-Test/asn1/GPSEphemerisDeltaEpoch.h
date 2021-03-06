/*
 * Generated by asn1c-0.9.23 (http://lionet.info/asn1c)
 * From ASN.1 module "RRLP-Components"
 * 	found in "../asn1src/RRLP-Components.asn"
 * 	`asn1c -gen-PER -fskeletons-copy -fnative-types`
 */

#ifndef	_GPSEphemerisDeltaEpoch_H_
#define	_GPSEphemerisDeltaEpoch_H_


#include <asn_application.h>

/* Including external dependencies */
#include "GPSDeltaElementList.h"
#include <constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declarations */
struct GPSDeltaEpochHeader;

/* GPSEphemerisDeltaEpoch */
typedef struct GPSEphemerisDeltaEpoch {
	struct GPSDeltaEpochHeader	*gpsDeltaEpochHeader	/* OPTIONAL */;
	GPSDeltaElementList_t	 gpsDeltaElementList;
	/*
	 * This type is extensible,
	 * possible extensions are below.
	 */
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} GPSEphemerisDeltaEpoch_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_GPSEphemerisDeltaEpoch;

#ifdef __cplusplus
}
#endif

/* Referred external types */
#include "GPSDeltaEpochHeader.h"

#endif	/* _GPSEphemerisDeltaEpoch_H_ */
#include <asn_internal.h>
