%module example

%{
#include "example.h"
%}

/* This example illustrates a couple of different techniques
   for manipulating C pointers */

/* First we'll use the pointer library */
extern void add(int *x, int *y, int *result);
%include cpointer.i
%pointer_functions(int, intp);

/* Next we'll use some typemaps */

%include typemaps.i
extern void sub(int *INPUT, int *INPUT, int *OUTPUT);

/* Next we'll use typemaps and the %apply directive */

%apply int *OUTPUT { int *r };
extern int divide(int n, int d, int *r);

%typemap(in) ( int *in, int inSize) {
  int i;
  if (!PyList_Check($input)) {
    PyErr_SetString(PyExc_ValueError, "Expecting a list");
    return NULL;
  }
  $2 = PyList_Size($input);
  $1 = (int *) malloc(($2)*sizeof(int));
  for (i = 0; i < $2; i++) {
    PyObject *s = PyList_GetItem($input,i);
    if (!PyInt_Check(s)) {
        free($1);
        PyErr_SetString(PyExc_ValueError, "List items must be integers");
        return NULL;
    }
    $1[i] = PyInt_AsLong(s);
  }
}

%typemap(freearg) (int *in, int inSize) {
   if ($1) free($1);
}

%typemap(in) ( int *out, int outSize) {
  if (!PyList_Check($input)) {
    PyErr_SetString(PyExc_ValueError, "Expecting a list");
    return NULL;
  }
  $2 = PyList_Size($input);
  $1 = (int *) malloc(($2)*sizeof(int));

}

%typemap(argout) (int *out, int outSize) {
  int i;
  $result = PyList_New($2);  
  for (i = 0; i < $2; i++) {
      PyObject *o = PyInt_FromLong($1[i]);
      PyList_SetItem($result, i, o);
  }
}

// %apply int *a { int *out };
extern void testPointer(int *in, int inSize, int *out, int outSize);