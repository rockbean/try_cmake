#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <pthread.h>

#include <foo.h>
#include <foo/myc_foo.h>
#include <common.h>

foo_t g_foo;

int myc_foo_enable(void)
{
	g_foo.foo = MYC_MOD_ENABLE;
	printf("FOO %d\n", g_foo.foo);
	return 0;
}

int myc_foo_disable(void)
{
	if (g_foo.foo == MYC_MOD_ENABLE) {
		g_foo.foo = MYC_MOD_DISABLE;
	}
	printf("FOO %d\n", g_foo.foo);
	return 0;
}