# import logging as lg


class singleton(object):
    def __init__(self, singleton_cls):
        self.singleton_cls = singleton_cls
        self.instance = None

    def __call__(self, *args, **kwargs):
        if self.instance is None:
            self.instance = self.singleton_cls(*args, **kwargs)
        return self.instance
