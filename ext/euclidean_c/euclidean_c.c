# include <ruby.h>;

static VALUE rb_euclidean(VALUE self, VALUE args)
{
  VALUE array_1;
  VALUE array_2;

  long arg_length;
  long vector_length;
  int index;

  double value;

  arg_length = RARRAY_LEN(args);

  if (arg_length > 2 || arg_length == 0) {
    rb_raise(rb_eArgError, "wrong number of arguments");
  }

  array_1 = rb_ary_entry(args, 0);
  if (arg_length == 2) {
    array_2 = rb_ary_entry(args, 1);
  } else {
    int i;
    array_2 = rb_ary_new2(RARRAY_LEN(array_1));
    for(i = 0; i < RARRAY_LEN(array_1); i++) {
      rb_ary_push(array_2, rb_float_new(0));
    }
  }

  if (RARRAY_LEN(array_1) != RARRAY_LEN(array_2)) {
    rb_raise(rb_eArgError, "lengths did not match");
  }

  vector_length = (RARRAY_LEN(array_1) - 1);
  value = 0.0;

  for(index = 0; index <= vector_length; index++) {
    double x, y;

    x = NUM2DBL(RARRAY_PTR(array_1)[index]);
    y = NUM2DBL(RARRAY_PTR(array_2)[index]);

    value += pow(x - y, 2.0);
  }

  return rb_float_new(sqrt(value));
}

void Init_euclidean_c()
{
  VALUE mMeasurable = rb_define_module("Measurable");
  rb_define_singleton_method(mMeasurable, "euclidean_c", rb_euclidean, -2);
}
