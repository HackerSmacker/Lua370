#include "locale.h"

char* setlocale(int category, const char* locale) {
	return "C";
}

struct lconv lconv_dummy;

struct lconv *localeconv(void) {
	lconv_dummy.decimal_point = ".";
	lconv_dummy.thousands_sep = ",";
	lconv_dummy.grouping = "";
	lconv_dummy.int_curr_symbol = "$";
	lconv_dummy.currency_symbol = "$";
	lconv_dummy.mon_decimal_point = ".";
	lconv_dummy.mon_thousands_sep = ",";
	lconv_dummy.mon_grouping = "";
	lconv_dummy.positive_sign = "+";
	lconv_dummy.negative_sign = "-";
	lconv_dummy.int_frac_digits = '1';
	lconv_dummy.frac_digits = '1';
	return &lconv_dummy;
}

char* tmpnam(char* str) {
	return "DDN:SYSTMP";
}

int strcoll(const char* str1, const char* str2) {
	return 0;
}
