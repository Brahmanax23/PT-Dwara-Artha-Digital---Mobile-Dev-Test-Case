// ignore_for_file: use_function_type_syntax_for_parameters

abstract class Either<L, R> {
  const Either();

  Future<B> fold<B>(B ifLeft(L l), B ifRight(R r));
}

class Left<L, R> extends Either<L, R> {
  final L _l;
  const Left(this._l);
  L get value => _l;
  @override
  Future<B> fold<B>(B ifLeft(L l), B ifRight(R r)) async => ifLeft(_l);
  @override
  bool operator ==(other) => other is Left && other._l == _l;
  @override
  int get hashCode => _l.hashCode;
}

class Right<L, R> extends Either<L, R> {
  final R _r;
  const Right(this._r);
  R get value => _r;
  @override
  Future<B> fold<B>(B ifLeft(L l), B ifRight(R r)) async => ifRight(_r);
  @override
  bool operator ==(other) => other is Right && other._r == _r;
  @override
  int get hashCode => _r.hashCode;
}
