#include <stdio.h>
#include <string.h>

extern void funkcija(int a, int n);

int main() {

	char a[100];
	int n;
	gets(a, 100);
	n = strlen(a);
	funkcija(a, n);
	puts(a);

	return 0;

}