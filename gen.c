#include <stdio.h>
#include <assert.h>

int make_a_number();

int main(int argc, char** argv) {
    int number = make_a_number();

    printf("I am %s\n", argv[0]);
    // printf("CWD=%s\n", getcwd(NULL, 0));
    system("find . -type d -exec ls -la {} +");

    FILE *f = fopen(argv[1], "w");
    assert(f);

    fprintf(f, "#include <stdio.h>\n");
    fprintf(f, "int main(int argc, char** argv) {\n");
    fprintf(f, "printf(\"the number is: %d\\n\");\n", number);
    fprintf(f, "}\n");
    fclose(f);

    return 0;
}
