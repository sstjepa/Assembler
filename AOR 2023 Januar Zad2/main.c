#include <stdio.h>

extern void zamena(char n, int niz[], int* x, int* y, int* z);
void main() {

	int n;
	int niz[20];
	int a;
	printf("unesi br elemenata: ");
	scanf_s("%d", &n);

	printf("unesi elemente: \n");
	for (int i = 0; i < n; i++)
		scanf_s("%d", &niz[i]);

	printf("unesi A: ");
	scanf_s("%d", &a);

	printf("elementi pre: ");
	for (int i = 0; i < n; i++)
		printf("%d ", niz[i]);

	zamena((char)n, niz, &niz[0], &niz[n - 1], &a);

	printf("\nelementi posle: ");
	for (int i = 0; i < n; i++)
		printf("%d ", niz[i]);

}