# python-pmc-singleton

Python package for singleton class decorator.

## Install

Regular use _(assuming that you've already published your package on NCBI Artifactory PyPI)_:

```sh
pip install pmc-singleton  # or add it to your requirements file
```

For development:

```sh
git clone ssh://git@bitbucket.be-md.ncbi.nlm.nih.gov:9418/pmc/python-pmc-singleton.git
cd python-pmc-singleton
pip install -r requirements/test.txt -e .
```

## Test

Test configuration is defined in the `tox.ini` file and includes `py.test` tests
and `flake8` source code checker.

You can run all of the tests:

```
python setup.py test
```

To run just the `py.test` tests, not `flake8`, and to re-use the current `virtualenv`:

```sh
py.test
```

## API

### Demo

The following example demonstrates the use of
`@singleton` decorator.

```python
>>> from pmc.singleton import singleton
>>> @singleton
... class YourClass:
...    pass
>>> instance_a = YourClass()
>>> instance_b = YourClass()
>>> instance_a is instance_b
True

```

As opposite example, where it is not used.

```python
>>> class YourClass:
...    pass
>>> instance_a = YourClass()
>>> instance_b = YourClass()
>>> instance_a is not instance_b
True

```
