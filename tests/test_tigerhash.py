from tigerhash import tigerhash


def test_basic_hexdigest():
    hash = tigerhash(b"helo world")

    assert hash.hexdigest() == "0299d88550e0ebbb0299d88550e0ebbb0299d88550e0ebbb"

def test_basic_digest():
    hash = tigerhash(b"helo world")

    assert hash.digest() == b'\x02\x99\xd8\x85P\xe0\xeb\xbb\x02\x99\xd8\x85P\xe0\xeb\xbb\x02\x99\xd8\x85P\xe0\xeb\xbb'

def test_update():
    hash1 = tigerhash(b"foobarbaz").digest()
    hasher = tigerhash()
    hasher.update(b"foo")
    hasher.update(b"bar")
    hasher.update(b"baz")
    hash2 = hasher.digest()

    assert hash1 == hash2

def test_copy():
    hash1 = tigerhash(b"foo")
    hash2 = hash1.copy()
    hash2.update(b"bar")

    assert hash1.digest() != hash2.digest()

def test_consts():
    hash1 = tigerhash(b"foo")

    assert hash1.name == "tigerhash"
    assert hash1.block_size == 64
    assert hash1.digest_size == len(hash1.digest())