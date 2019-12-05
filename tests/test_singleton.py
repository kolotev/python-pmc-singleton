from pmc.singleton import singleton


def test_singleton():
    """
    Test ``pmc.singleton.singleton`` functionality.
    """

    @singleton
    class TestClassA:
        pass

    @singleton
    class TestClassB:
        pass

    instance_a_one = TestClassA()
    instance_a_two = TestClassA()
    instance_b = TestClassB()

    assert instance_a_one is instance_a_two
    assert instance_a_one is not instance_b
