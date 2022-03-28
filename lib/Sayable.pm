package Sayable;

# ロールはインターフェースのようなもの
use Moose::Role;

# このメソッドを実装する必要がある
requires 'say';

sub not_say {
    my ( $self ) = @_;
    not $self->say();
}

# requireやuseされたファイルは、
# 正常にコンパイルされ、初期化コードを正しく実行したことを示すために、
# 真を返さなければならない。
1;
