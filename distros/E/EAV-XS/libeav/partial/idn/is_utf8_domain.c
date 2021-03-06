#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <idna.h>
#include <eav.h>
#include <eav/private.h>
#include <eav/auto_tld.h>

/* is_utf8_inet_domain: validates that domain is fqdn & have valid tld */
extern int
is_utf8_domain (int *r,
                const char *start,
                const char *end,
                bool tld_check)
{
    int rc = EEAV_NO_ERROR;
    bool iserr = false;
    char *domain = NULL;
    char *ch = NULL;
    size_t len;
    extern int is_ascii_domain (const char *start, const char *end);
    extern int is_tld (const char *start, const char *end);
    extern int is_special_domain (const char *start, const char *end);


    if (start == end)
        return inverse(EEAV_DOMAIN_EMPTY);

    *r = idna_to_ascii_lz (start, &domain, 0);

    if (*r != IDNA_SUCCESS) {
        iserr = true; rc = EEAV_IDN_ERROR;
        goto done;
    }

    len = strlen (domain);
    rc = is_ascii_domain (domain, domain + len);

    if (rc != EEAV_NO_ERROR)
        goto done;

    if (tld_check == false)
        goto done; /* EEAV_NO_ERROR */

    /* special & reserved domains */
    if (is_special_domain (domain, domain + len)) {
        rc = TLD_TYPE_SPECIAL;
        goto done;
    }

    /* fqdn & tld tests */
    ch = strrchr(domain, '.');

    if (ch == NULL) {
        iserr = true; rc = EEAV_DOMAIN_NOT_FQDN;
        goto done;
    }

    rc = is_tld (ch + 1, domain + len);


done:
    if (domain != NULL)
        free (domain);

    return iserr ? inverse (rc) : rc;
}
