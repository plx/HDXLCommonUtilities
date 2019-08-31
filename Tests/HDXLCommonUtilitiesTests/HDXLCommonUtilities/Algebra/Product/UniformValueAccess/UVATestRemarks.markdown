# Uniform Value Access Test Remarks

These are some of the only tests for the product implementations b/c most of the code in the implementations is correct-by-construction (due to the level of genericity).

The uniform value access methods introduce more possibilities for error and thus I put my testing here, too.

Note, further, that I deliberately test both the COW and inline implementations: each pair will share the protocol-extension supplied implementations, but doing this is an easy way to exercise the COW implementation, too.
