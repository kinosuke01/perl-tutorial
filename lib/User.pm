package User;

use Moose;

# Personクラスを継承
extends 'Person';

# Sayableインターフェースの取り込み
with 'Sayable';

no Moose;
__PACKAGE__->meta->make_immutable;

1;
