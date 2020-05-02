#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <pthread.h>

#include <common.h>
#include <boo.h>
#include <boo/myc_boo.h>

boo_t g_boo;

int myc_boo_enable(void)
{
	g_boo.boo = MYC_MOD_ENABLE;
	printf("BOO %d\n", g_boo.boo);
	return 0;
}

int myc_boo_disable(void)
{
	if (g_boo.boo == MYC_MOD_ENABLE) {
		g_boo.boo = MYC_MOD_DISABLE;
	}
	printf("BOO %d\n", g_boo.boo);
	return 0;
}