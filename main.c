#include <stdio.h>

void fizzbuzz(); //This is how you call an assembly function

//When you call this from assembly, registers R0 through R3 GET WIPED
void print_fizz() {
	printf("Fizz\n");
	return;
}

void print_buzz() {
	printf("Buzz\n");
	return;
}

void print_fizzbuzz() {
	printf("FizzBuzz\n");
	return;
}

void print_number(int x) {
	printf("%i\n",x);
	return;
}

int main() {
	printf("Calling your assembly fizzbuzz program...\n");
	fizzbuzz();
	printf("Your assembly fizzbuzz successfully returned control.\n");
}
