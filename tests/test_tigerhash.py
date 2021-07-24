import tigerhash


def test_basic():
    hash_value = tigerhash.tigerhash(b"helo world")
    assert hash_value == b"0299d88550e0ebbb0299d88550e0ebbb0299d88550e0ebbb"