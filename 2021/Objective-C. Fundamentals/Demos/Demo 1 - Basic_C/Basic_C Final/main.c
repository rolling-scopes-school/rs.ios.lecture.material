
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// MARK: - Definitions

typedef struct {
    char *name;
    size_t age;
} person_t;

// MARK: - Prototypes

void login_user(person_t *user);

// MARK: - Implementations

int main(int argc, char * argv[]) {
    person_t user;
    login_user(&user);

    return 0;
}

void login_user(person_t *user) {
    char buffer[256];

    puts("What is your name?");
    scanf("%s", buffer);
    printf("Hello, %s!\n", buffer);

    user->name = malloc(sizeof(char) * (strlen(buffer) + 1));
    user->name = strcpy(user->name, buffer);

    puts("How old are you?");
    scanf("%lu", &user->age);
    printf("Nice, %lu\n", user->age);
}