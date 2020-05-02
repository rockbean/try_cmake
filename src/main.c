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
#ifdef MYC_FOO_SUPPORT
#include <foo/myc_foo.h>
#endif
#ifdef MYC_BOO_SUPPORT
#include <boo/myc_boo.h>
#endif

void *myc_thread(void *arg);

void *myc_thread(void *arg) 
{
	sleep(1);
	printf("Hello from thread\n");
	return NULL;
}

int main(void)
{
	pthread_t thread_id;
	printf("Hello World\n");
#ifdef MYC_FOO_SUPPORT
	myc_foo_enable();
	myc_foo_disable();
#endif

	pthread_create(&thread_id, NULL, myc_thread, NULL); 
	pthread_join(thread_id, NULL);

#ifdef MYC_BOO_SUPPORT
	myc_boo_enable();
	myc_boo_disable();
#endif
	return 0;
}