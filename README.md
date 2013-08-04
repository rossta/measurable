# Measurable

A gem to test what metric is best for certain kinds of datasets in machine learning.

Besides the `Array` class, I also want to support `NVector` (from [NMatrix](http://github.com/sciruby/nmatrix)).

The distance measures will be created in Ruby first. If I see that it's really too slow, I'll write some methods in C (or Java, for JRuby).

This is a fork of the gem [Distance Measure](https://github.com/reddavis/Distance-Measures), which has a similar objective, but isn't actively maintained and doesn't support NMatrix. Thank you, [@reddavis][reddavis]. :)

## Install

`gem install measurable`

I only tested it with 2.0.0 (yes, yes, travis, I'll do it eventually). I want to support JRuby as well.

## Distance measures

I'm using the term "distance measure" without much concern for the strict mathematical definition of a metric. If the documentation for one of the methods isn't clear about it being or not a metric, please open an issue.

The following are the similarity measures supported at the moment:

- Euclidean distance
- Squared euclidean distance
- Cosine distance
- Max-min distance (from ["K-Means clustering using max-min distance measure"][maxmin])
- Jaccard distance
- Tanimoto distance
- Haversine distance
- Minkowski (Cityblock or Manhattan) distance
- Chebyshev distance
- Hamming distance

These still need to be implemented:

- Correlation distance
- Chi-square distance
- Kullback-Leibler divergence
- Jensen-Shannon divergence
- Mahalanobis distance
- Squared Mahalanobis distance

I plan to update the specs to reflect that each method is (or isn't) a mathematical metric, but I want to finish implementing them first. Any help is appreciated! :)

## How to use

The API I intend to support is something like this:

```ruby
require "measurable"

u = NVector.ones(2)
v = NVector.zeros(2)
w = [1, 0]
x = [2, 2]

# Calculate the distance between two points in space.
Measurable.euclidean(u, v) # => 1.41421
Measurable.euclidean(w, v) # => 1.00000
Measurable.cosine([1, 2], [2, 3]) # => 0.00772

# Calculate the norm of a vector, i.e. its distance from the origin.
Measurable.euclidean_squared([3, 4]) # => 25
```

## Documentation

`RDoc` syntax is used to document the project. To build it locally, you'll need to install the [Fivefish generator](https://github.com/ged/rdoc-generator-fivefish) (`gem install rdoc-generator-fivefish`) and run the following command:

```bash
rdoc -f fivefish -m README.md *.md LICENSE lib/
```

I want to be able to use a Rake task to generate the documentation, thus allowing me to forget the specific command. However, there's a bug in `RDoc::Task` in which [custom generators (like Fivefish) can't be used](https://github.com/rdoc/rdoc/issues/246).

If there's something wrong with an explanation or if there's information missing, please open an issue or send a pull request.

## License

See LICENSE for details.

The original `distance_measures` gem is copyrighted by [@reddavis][reddavis].

[maxmin]: http://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=05156398
[reddavis]: (https://github.com/reddavis)